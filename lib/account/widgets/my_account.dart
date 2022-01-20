import 'package:flutter/material.dart';
import 'package:movie_market_place/account/widgets/account_grid.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Manage My Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            AccountGrid(
              heading: 'Personal Profile',
              title: 'Khizr Farooqui',
              subTitle: 'khizr.farooqui@venturedive.com',
            ),
            AccountGrid(
              heading: 'Address Book',
              title: 'Khizr Farooqui',
              subTitle:
                  'Dilkusha Forum, 12th Floor, Tariq Rd, Delhi CHS PECHS, Karachi, Karachi City, Sindh',
            ),
          ],
        ),
      ],
    );
  }
}
