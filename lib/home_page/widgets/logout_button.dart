import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: FloatingActionButton.small(
        heroTag: "fab4",
        elevation: 0,
        onPressed: onTap,
        child: const Icon(
          Icons.logout,
          size: 18.0,
        ),
      ),
    );
  }
}