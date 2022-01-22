import 'package:flutter/material.dart';

double _screen = 800;

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

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
        SizedBox(
          height: size.width > _screen ? 300 : 400,
          width: size.width * 0.7,
          child: Card(
            color: const Color(0xff361F41),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: size.width > _screen
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildColumn(
                          'Full Name',
                          'Vendian',
                          'Birthday',
                          '01/01/2012',
                        ),
                        buildColumn(
                          'Email Address',
                          'venture@venturedive.com',
                          'Gender',
                          'Male',
                        ),
                        buildColumn(
                          'Mobile',
                          '+923343586878',
                          'Account Type',
                          'Standard',
                        ),
                      ],
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          buildColumn(
                            'Full Name',
                            'Vendian',
                            'Birthday',
                            '01/01/2012',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          buildColumn(
                            'Email Address',
                            'venture@venturedive.com',
                            'Gender',
                            'Male',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          buildColumn(
                            'Mobile',
                            '+923343586878',
                            'Account Type',
                            'Standard',
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildColumn(
    msg1,
    msg2,
    msg3,
    msg4,
  ) {
    return Column(
      children: [
        Text(
          msg1,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          msg2,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          msg3,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          msg4,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
