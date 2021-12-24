import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final String title;
  final Color iconColor;
  final IconData icon;
  const DialogBox({Key? key, required this.title, required this.iconColor, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff322043),
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      content: Icon(
        icon, size: 50.0, color: iconColor,
      ),
    );
  }
}
