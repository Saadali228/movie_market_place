import 'package:flutter/material.dart';

class AddressBook extends StatelessWidget {
  const AddressBook({Key? key}) : super(key: key);

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
        SizedBox(
          height: size.height * 0.7,
          width: size.width * 0.75,
          child: Card(
            color: const Color(0xff361F41),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      textColumn(
                        'Full Name',
                        'Vendian',
                      ),
                      textColumn(
                        'Address',
                        'Dilkusha Forum, 12th Floor, Tariq Rd, Delhi CHS PECHS',
                      ),
                      textColumn(
                        'Region',
                        'Sindh, Karachi, PK',
                      ),
                      textColumn(
                        'Phone Number',
                        '00000000000',
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
        ),
      ],
    );
  }

  Widget textColumn(String text1, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          text2,
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
