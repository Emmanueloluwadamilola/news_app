import 'package:flutter/material.dart';

class CircularIconWidget extends StatelessWidget {
  const CircularIconWidget({
    super.key, required this.shadowColor, required this.mainColor, required this.icon,
  });
  final Color shadowColor;
  final Color mainColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 110,
      decoration:  BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: 20,
          ),
        ],
        shape: BoxShape.circle,
        color: mainColor,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}
