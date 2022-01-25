import 'package:flutter/material.dart';

double _screen = 800;

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30.0),
          SizedBox(
            width: size.width * 0.7,
            child: Card(
              color: const Color(0xff361F41),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: size.width > _screen
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildColumn(
                            'Full Name',
                            'Talha Javed',
                            'Birthday',
                            '12/09/1997',
                            context,
                          ),
                          buildColumn(
                            'Email Address',
                            'talha.khan@venturedive.com',
                            'Gender',
                            'Male',
                            context,
                          ),
                          buildColumn(
                            'Mobile',
                            '+923343586878',
                            'Account Type',
                            'Standard',
                            context,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildColumn(
                            'Full Name',
                            'Talha Javed',
                            'Birthday',
                            '12/09/1997',
                            context,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          buildColumn(
                            'Email Address',
                            'talha.khan@venturedive.com',
                            'Gender',
                            'Male',
                            context,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          buildColumn(
                            'Mobile',
                            '+923343586878',
                            'Account Type',
                            'Standard',
                            context,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildColumn(
    msg1,
    msg2,
    msg3,
    msg4,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: MediaQuery.of(context).size.width > _screen
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          msg1,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        FittedBox(
          child: Text(
            msg2,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
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
