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
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 30.0),
          AddressGrid(
            name: 'Vendian1',
            address: 'Dilkusha Forum, 12th Floor, Tariq Rd, Delhi CHS PECHS',
            region: 'Sindh, Karachi, PK',
            phoneNo: '00000000000',
          ),
          SizedBox(height: 20.0),
          AddressGrid(
            name: 'Vendian2',
            address: '225 CCA, Sector FF, Phase 4, DHA, 54810',
            region: 'Punjab, Lahore, PK',
            phoneNo: '11111111111',
          ),
          SizedBox(height: 20.0),
          AddressGrid(
            name: 'Vendian3',
            address: 'Astro Labs, Cluster R Parkside, Retail Level',
            region: 'UAE, Dubai',
            phoneNo: '22222222222',
          ),
        ],
      ),
    );
  }
}
