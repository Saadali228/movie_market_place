import 'package:flutter/material.dart';

class AccountGrid extends StatelessWidget {
  const AccountGrid({
    Key? key,
    required this.heading,
    required this.title,
    required this.subTitle,
    this.phoneNo,
  }) : super(key: key);

  final String heading;
  final String title;
  final String subTitle;
  final String? phoneNo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        color: const Color(0xff361F41),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                heading,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (phoneNo != null)
                Text(
                  phoneNo!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
