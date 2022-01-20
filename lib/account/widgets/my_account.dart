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
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 20,
          children: const [
            AccountGrid(
              heading: 'Personal Profile',
              title: 'Khizr Farooqui',
              subTitle: 'khizr_farooqui@hotmail.com',
            ),
            AccountGrid(
              heading: 'Address Book',
              title: 'Khizr Farooqui',
              subTitle:
                  'House#B-215, Block 13D-1, Gulshan-e-Iqbal, Karachi Sindh - Karachi - Gulshan-e-Iqbal - Block 13 (+92) 3362209062',
            ),
          ],
        ),
      ],
    );
  }
}
