import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: FloatingActionButton.small(
        elevation: 0,
        onPressed: onTap,
        child: const Icon(
          Icons.search,
          size: 18.0,
        ),
      ),
    );
  }
}
