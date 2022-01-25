import 'package:flutter/material.dart';
import 'package:movie_market_place/account/widgets/address_grid.dart';

class MyAddress extends StatelessWidget {
  const MyAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'My Address',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.0),
          AddressGrid(
            name: 'Office',
            address: 'Dilkusha Forum, 12th Floor, Tariq Rd, Delhi CHS PECHS',
            region: 'Sindh, Karachi, PK',
            phoneNo: '0343-8728912',
          ),
          SizedBox(height: 20.0),
          AddressGrid(
            name: 'Home',
            address: 'House#A-312, Block 1, Gulistan-e-Jauhar',
            region: 'Sindh, Karachi, PK',
            phoneNo: '0312-2049767',
          ),
          SizedBox(height: 20.0),
          AddressGrid(
            name: 'Home',
            address: 'House#C-63, Block 13D-1, Gulshan-e-Iqbal',
            region: 'Sindh, Karachi, PK',
            phoneNo: '0306-7463472',
          ),
        ],
      ),
    );
  }
}
