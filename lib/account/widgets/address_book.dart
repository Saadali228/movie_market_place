import 'package:flutter/material.dart';

class AddressBook extends StatelessWidget {
  const AddressBook({Key? key}) : super(key: key);

  Widget buildColumn(msg1, msg2) {
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
          height: 30,
        ),
        Text(
          msg2,
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
          'Address Book',
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
                  children: [
                    buildColumn(
                      'Full Name',
                      'Syed Saad Ali',
                    ),
                    // const SizedBox(
                    //   width: 30,
                    // ),
                    buildColumn(
                      'Address',
                      'A300, Block N, North Nazimabad',
                    ),
                    buildColumn(
                      'Region',
                      'Sindh, Karachi, PK',
                    ),
                    buildColumn(
                      'Phone Number',
                      '03343586862',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50.0, top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          '+Add New Address',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
