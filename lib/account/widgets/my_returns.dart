import 'package:flutter/material.dart';
import 'package:movie_market_place/account/widgets/order_grid.dart';

class MyReturns extends StatelessWidget {
  const MyReturns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'My Returns',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.0),
          OrderGrid(
            orderNo: '266',
            placedOn: '6/9/21',
            image:
                'https://image.tmdb.org/t/p/w500/mFbS5TwN95BcSEfiztdchLgTQ0v.jpg',
            title: 'The Last Duel',
            status: 'Refunded',
            date: 'Refunded On: 29/9/21',
          ),
        ],
      ),
    );
  }
}
