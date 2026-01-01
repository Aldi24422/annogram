import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';

class TypingIndicator extends StatefulWidget {
  final Color color;
  const TypingIndicator({super.key, this.color = AppColors.royalBlue});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (index) {
          return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              // Membuat efek gelombang (delay per dot)
              double value = (_animation.value + index * 0.2) % 1.0;
              double offset = (value - 0.5).abs() * 2; // Naik turun 0 -> 1 -> 0

              return Transform.translate(
                offset: Offset(0, -offset * 6), // Gerak vertikal 6 pixel
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: widget.color.withValues(alpha: 0.6 + (offset * 0.4)),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
