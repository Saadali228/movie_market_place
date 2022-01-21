import 'package:flutter/material.dart';
import 'package:movie_market_place/account/widgets/order_grid.dart';

class MyCancellations extends StatelessWidget {
  const MyCancellations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'My Cancellations',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          OrderGrid(
            orderNo: '241',
            placedOn: '28/08/2021',
            image:
                'https://image.tmdb.org/t/p/w500/zlj0zHo67xXoj7hvwGtaKRkSdBV.jpg',
            title: 'Encounter',
            status: 'Cancelled',
            date: 'Cancelled On: 01/09/21',
          ),
          SizedBox(height: 20.0),
          OrderGrid(
            orderNo: '198',
            placedOn: '23/08/2021',
            image:
                'https://image.tmdb.org/t/p/w500/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg',
            title: 'Free Guy',
            status: 'Cancelled',
            date: 'Cancelled On: 24/08/21',
          ),
        ],
      ),
    );
  }
}
