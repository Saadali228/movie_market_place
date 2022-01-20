import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: FloatingActionButton.small(
        heroTag: "fab3",
        elevation: 0,
        onPressed: onTap,
        child: const Icon(
          Icons.person,
          size: 18.0,
        ),
      ),
    );
  }
}
