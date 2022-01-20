import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  Widget buildColumn(
    msg1,
    msg2,
    msg3,
    msg4,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          msg1,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          msg2,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          msg3,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          msg4,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 30.0),
        Container(
          height: size.height * 0.7,
          width: size.width * 0.75,
          color: const Color(0xff361F41),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildColumn(
                      'Full Name',
                      'Syed Saad Ali',
                      'Birthday',
                      '02/03/1999',
                    ),
                    buildColumn(
                      'Email Address',
                      'saad.ali@venturedive.com',
                      'Gender',
                      'Male',
                    ),
                    buildColumn(
                      'Mobile',
                      '+923343586862',
                      'Account Type',
                      'Standard',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
