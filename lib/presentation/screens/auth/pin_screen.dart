import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/services/security_service.dart';

class PinScreen extends StatefulWidget {
  final VoidCallback onSuccess;
  final bool isSettingNew; // True jika sedang setting PIN baru

  const PinScreen({super.key, required this.onSuccess, this.isSettingNew = false});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String _input = "";
  final int _pinLength = 4;

  void _onNumberTap(String number) {
    if (_input.length < _pinLength) {
      setState(() {
        _input += number;
      });
      
      if (_input.length == _pinLength) {
        _submit();
      }
    }
  }

  void _onDelete() {
    if (_input.isNotEmpty) {
      setState(() {
        _input = _input.substring(0, _input.length - 1);
      });
    }
  }

  void _submit() {
    // Jika mode setting PIN baru
    if (widget.isSettingNew) {
      SecurityService().setPin(_input);
      widget.onSuccess();
      return;
    }

    // Jika mode verifikasi
    if (SecurityService().verifyPin(_input)) {
      widget.onSuccess();
    } else {
      // PIN Salah
      setState(() => _input = "");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Incorrect PIN"), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.midnightBlue,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Icon(Icons.lock_outline, size: 50, color: AppColors.royalBlue),
            const SizedBox(height: 20),
            Text(
              widget.isSettingNew ? "Set New PIN" : "Enter PIN",
              style: const TextStyle(color: AppColors.creamWhite, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Access your private messages",
              style: TextStyle(color: AppColors.softBlueGrey.withValues(alpha: 0.7)),
            ),
            const SizedBox(height: 50),
            
            // Indikator PIN (Titik-titik)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pinLength, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < _input.length ? AppColors.royalBlue : AppColors.inputFill,
                    border: Border.all(color: AppColors.royalBlue),
                  ),
                );
              }),
            ),
            
            const Spacer(),
            
            // Keypad
            _buildKeypad(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          _buildRow(['1', '2', '3']),
          const SizedBox(height: 20),
          _buildRow(['4', '5', '6']),
          const SizedBox(height: 20),
          _buildRow(['7', '8', '9']),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 70), // Spacer kiri
              _buildButton('0'),
              _buildDeleteButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> numbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: numbers.map((n) => _buildButton(n)).toList(),
    );
  }

  Widget _buildButton(String number) {
    return GestureDetector(
      onTap: () => _onNumberTap(number),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.inputFill,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 5)
          ]
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(color: AppColors.creamWhite, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return GestureDetector(
      onTap: _onDelete,
      child: Container(
        width: 70,
        height: 70,
        color: Colors.transparent,
        child: const Icon(Icons.backspace_outlined, color: AppColors.softBlueGrey),
      ),
    );
  }
}