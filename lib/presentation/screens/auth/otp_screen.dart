import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/services/telegram_isolate_service.dart';
import '../../../core/theme/colors.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  final TelegramIsolateService telegram;

  const OTPScreen({
    super.key,
    required this.phoneNumber,
    required this.telegram,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  // Telegram OTP is 5 digits
  final List<TextEditingController> _controllers =
      List.generate(5, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());
  bool _isLoading = false;

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 4) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    if (_controllers.every((c) => c.text.isNotEmpty)) {
      _submit();
    }
  }

  void _submit() {
    final code = _controllers.map((c) => c.text).join();
    if (code.length < 5) return;

    setState(() => _isLoading = true);
    widget.telegram.send({
      '@type': 'checkAuthenticationCode',
      'code': code,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.midnightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.creamWhite),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                "Verification Code",
                style: GoogleFonts.lora(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.creamWhite),
              ),
              const SizedBox(height: 16),
              Text(
                widget.phoneNumber.isNotEmpty
                    ? "We sent a code to ${widget.phoneNumber}"
                    : "We sent a code to your number",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: AppColors.softBlueGrey, fontSize: 16),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  return SizedBox(
                    width: 55,
                    height: 60,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: AppColors.creamWhite,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: "",
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 12),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Color(0x33A9B5DF)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: AppColors.royalBlue, width: 2),
                        ),
                        fillColor: AppColors.inputFill,
                        filled: true,
                      ),
                      onChanged: (value) => _onChanged(value, index),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 48),
              if (_isLoading)
                const CircularProgressIndicator(color: AppColors.royalBlue)
              else
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Resend logic if needed (TDLib handles resend automatically via wait time usually)
                        widget.telegram
                            .send({'@type': 'resendAuthenticationCode'});
                      },
                      child: const Text(
                        "Resend code",
                        style: TextStyle(
                            color: AppColors.royalBlue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () async {
                        // RESET FLOW:
                        // 1. Send LogOut to clear TDLib state
                        widget.telegram.send({'@type': 'logOut'});

                        // 2. Dispose Singleton (Kill Isolate) to ensure fresh start
                        await widget.telegram.dispose();

                        // 3. Restart App via Navigation
                        if (context.mounted) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (route) => false);
                        }
                      },
                      child: const Text(
                        "Wrong Number?",
                        style: TextStyle(
                            color: AppColors.error, // Warning/Attention color
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
