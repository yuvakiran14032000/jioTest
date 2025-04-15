import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  final double size;
  const Bubble({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          // colors: [Color(0xff6c63ff), Color(0xff49d67a)],
          colors: [
            Colors.blue.withAlpha(200),
            Color(0xff49d67a).withAlpha(150),
          ],
        ),
      ),
    );
  }
}
