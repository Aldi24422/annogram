import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/services/telegram_isolate_service.dart';
import '../../../core/theme/colors.dart';
import '../main_screen.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TelegramIsolateService _telegram = TelegramIsolateService.instance;
  final int myApiId = 13350342;
  final String myApiHash = "25d27fc55b118beab6499b854d385048";

  String _currentAuthState = "Menginisialisasi...";
  bool _isLoading = false;
  String _lastPhoneNumber = "";

  @override
  void initState() {
    super.initState();
    _initializeLogin();
  }

  Future<void> _initializeLogin() async {
    // Don't call initialize() - it's already done by TelegramProvider in main.dart
    // Just wait for the service to be ready
    int retries = 0;
    while (!_telegram.isReady && retries < 50) {
      await Future.delayed(const Duration(milliseconds: 100));
      retries++;
    }

    _telegram.rawEventStream.listen((event) {
      Map<String, dynamic>? authState;

      // Case 1: Standard update event
      if (event['@type'] == 'updateAuthorizationState') {
        authState = event['authorization_state'];
      }
      // Case 2: Direct response from getAuthorizationState
      else if (event['@type']?.toString().startsWith('authorizationState') ==
          true) {
        authState = event;
      }

      if (authState != null && mounted) {
        // Prevent unnecessary rebuilds
        if (_currentAuthState != authState['@type']) {
          setState(() {
            _currentAuthState = authState!['@type'];
            _isLoading = false;
          });
          _handleAuthState(authState);
        }
      }
    });

    // Explicitly request current state to catch 'Ready' or 'Wait' events
    // that happened before this screen subscribed.
    _telegram.send({'@type': 'getAuthorizationState'});
  }

  Future<void> _handleAuthState(Map state) async {
    switch (state['@type']) {
      case 'authorizationStateWaitTdlibParameters':
        final directory = await getApplicationDocumentsDirectory();
        _telegram.send({
          '@type': 'setTdlibParameters',
          'database_directory': '${directory.path}/tdlib',
          'use_message_database': true,
          'use_secret_chats': true,
          'api_id': myApiId,
          'api_hash': myApiHash,
          'system_language_code': 'en',
          'device_model': 'AnnoGram Device',
          'application_version': '1.0',
        });
        break;
      case 'authorizationStateWaitEncryptionKey':
        _telegram.send(
            {'@type': 'checkDatabaseEncryptionKey', 'encryption_key': ''});
        break;
      case 'authorizationStateWaitCode':
        // FIX: If we are waiting for code but don't have a phone number (Fresh Start),
        // we should reset the session instead of showing an empty OTP screen.
        if (_lastPhoneNumber.isEmpty) {
          debugPrint("⚠️ Stale WaitCode state detected. Resetting session...");
          _telegram.send({'@type': 'logOut'});
          return;
        }

        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => OTPScreen(
                phoneNumber: _lastPhoneNumber,
                telegram: _telegram,
              ),
            ),
          );
        }
        break;
      case 'authorizationStateReady':
        if (mounted) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const MainScreen()));
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool showInput =
        _currentAuthState == 'authorizationStateWaitPhoneNumber' ||
            _currentAuthState == 'authorizationStateWaitCode' ||
            _currentAuthState == 'authorizationStateWaitPassword';

    return Scaffold(
      // 1. BACKGROUND SENADA DENGAN CHAT LIST
      backgroundColor: AppColors.midnightBlue,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _LoginHeader(),
                const SizedBox(height: 40),
                if (showInput)
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      // 2. KARTU MENGGUNAKAN WARNA TEMA SURFACE
                      color: AppColors.cardSurface,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x33000000), // Black 20%
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ],
                    ),
                    child: _FinalOptimizedForm(
                      authState: _currentAuthState,
                      telegram: _telegram,
                      isLoading: _isLoading,
                      onLoading: (val) => setState(() => _isLoading = val),
                      onPhoneSubmitted: (phone) => _lastPhoneNumber = phone,
                    ),
                  )
                else
                  const _LoadingIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 3. LOGO ASLI (BUKAN ICON)
        Container(
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // Menggunakan warna Royal Blue transparan sebagai glow halus
              color: Color(0x1A7886C7),
              boxShadow: [
                BoxShadow(
                    color: Color(0x1A7886C7), blurRadius: 30, spreadRadius: 5)
              ]),
          child: ClipOval(
            child: Padding(
              padding: const EdgeInsets.all(
                  12.0), // Padding agar logo tidak mepet pinggir
              child: Image.asset(
                'assets/images/logo-annogram.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image,
                      color: AppColors.softBlueGrey);
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text("AnnoGram",
            style: GoogleFonts.lora(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.creamWhite,
                letterSpacing: 1.0)),
        // 4. TAGLINE DIHAPUS SESUAI PERMINTAAN
      ],
    );
  }
}

class _FinalOptimizedForm extends StatefulWidget {
  final String authState;
  final TelegramIsolateService telegram;
  final bool isLoading;
  final Function(bool) onLoading;
  final Function(String) onPhoneSubmitted;

  const _FinalOptimizedForm(
      {required this.authState,
      required this.telegram,
      required this.isLoading,
      required this.onLoading,
      required this.onPhoneSubmitted});

  @override
  State<_FinalOptimizedForm> createState() => _FinalOptimizedFormState();
}

class _FinalOptimizedFormState extends State<_FinalOptimizedForm> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<Map<String, String>> _selectedCountry =
      ValueNotifier({'name': 'Indonesia', 'code': '+62', 'flag': '🇮🇩'});

  final List<Map<String, String>> _countries = const [
    {'name': 'Indonesia', 'code': '+62', 'flag': '🇮🇩'},
    {'name': 'Malaysia', 'code': '+60', 'flag': '🇲🇾'},
    {'name': 'Singapore', 'code': '+65', 'flag': '🇸🇬'},
    {'name': 'USA', 'code': '+1', 'flag': '🇺🇸'},
    {'name': 'UK', 'code': '+44', 'flag': '🇬🇧'},
    {'name': 'India', 'code': '+91', 'flag': '🇮🇳'},
    {'name': 'Russia', 'code': '+7', 'flag': '🇷🇺'},
  ];

  @override
  void didUpdateWidget(covariant _FinalOptimizedForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.authState == 'authorizationStateWaitPhoneNumber' &&
        widget.authState == 'authorizationStateWaitCode') {
      _controller.clear();
    }
  }

  void _submit() {
    if (_controller.text.isEmpty) return;
    widget.onLoading(true);

    if (widget.authState == 'authorizationStateWaitPhoneNumber') {
      String phone = _controller.text.trim();
      if (phone.startsWith('0')) phone = phone.substring(1);
      final fullPhone = _selectedCountry.value['code']! + phone;
      widget.onPhoneSubmitted(fullPhone);
      widget.telegram.send({
        '@type': 'setAuthenticationPhoneNumber',
        'phone_number': fullPhone,
      });
    } else {
      widget.telegram.send({
        '@type': widget.authState == 'authorizationStateWaitCode'
            ? 'checkAuthenticationCode'
            : 'checkAuthenticationPassword',
        widget.authState == 'authorizationStateWaitCode' ? 'code' : 'password':
            _controller.text,
      });
    }
  }

  void _pickCountry() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardSurface,
        title: const Text("Select Country",
            style: TextStyle(color: AppColors.creamWhite)),
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
          child: ListView.builder(
            itemCount: _countries.length,
            itemBuilder: (context, i) => ListTile(
              leading: Text(_countries[i]['flag']!,
                  style: const TextStyle(fontSize: 22)),
              title: Text(_countries[i]['name']!,
                  style: const TextStyle(color: AppColors.creamWhite)),
              trailing: Text(_countries[i]['code']!,
                  style: const TextStyle(color: AppColors.softBlueGrey)),
              onTap: () {
                _selectedCountry.value = _countries[i];
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPhone = widget.authState == 'authorizationStateWaitPhoneNumber';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isPhone ? "Welcome Back" : "Verification Code",
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.creamWhite),
        ),
        const SizedBox(height: 8),
        Text(
          isPhone
              ? "Please enter your number"
              : "We sent a code to your Telegram app",
          style: const TextStyle(color: AppColors.softBlueGrey, fontSize: 13),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            // 5. INPUT FIELD MENGGUNAKAN WARNA TEMA INPUT FILL
            color: AppColors.inputFill,
            borderRadius: BorderRadius.circular(16),
            border:
                Border.all(color: const Color(0x33A9B5DF)), // SoftBlueGrey 20%
          ),
          child: Row(
            children: [
              if (isPhone) ...[
                GestureDetector(
                  onTap: _pickCountry,
                  child: ValueListenableBuilder(
                    valueListenable: _selectedCountry,
                    builder: (context, country, _) => Row(
                      children: [
                        Text(country['flag']!,
                            style: const TextStyle(fontSize: 24)),
                        const SizedBox(width: 8),
                        Text(country['code']!,
                            style: const TextStyle(
                                color: AppColors.creamWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        const Icon(Icons.arrow_drop_down,
                            color: AppColors.softBlueGrey),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 24, width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  color: const Color(0x4DA9B5DF), // SoftBlueGrey 30%
                ),
              ],
              Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  textAlign: isPhone ? TextAlign.left : TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.creamWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                  decoration: InputDecoration(
                    hintText: isPhone ? "812 3456 789" : "- - - - -",
                    // Hint text disesuaikan dengan tema
                    hintStyle: const TextStyle(color: Color(0x80A9B5DF)),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: widget.isLoading ? null : _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.royalBlue,
              foregroundColor: AppColors.creamWhite,
              elevation: 5,
              shadowColor: const Color(0x667886C7), // RoyalBlue 40%
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            child: widget.isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2))
                : const Text("CONTINUE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 1.0)),
          ),
        ),
      ],
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
                color: AppColors.royalBlue, strokeWidth: 3)),
        SizedBox(height: 20),
        Text("Connecting to Telegram...\n(Please wait, this may take a moment)",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.softBlueGrey, fontSize: 13)),
      ],
    );
  }
}
