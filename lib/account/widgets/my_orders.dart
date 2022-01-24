import 'package:flutter/material.dart';
import 'package:movie_market_place/account/widgets/order_grid.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'My Orders',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          OrderGrid(
            orderNo: '319',
            placedOn: '31/12/21',
            image:
                'https://image.tmdb.org/t/p/w500/c6H7Z4u73ir3cIoCteuhJh7UCAR.jpg',
            title: 'Eternals',
            status: 'Delivered',
            date: 'Delivered On: 5/1/22',
          ),
          SizedBox(height: 20.0),
          OrderGrid(
            orderNo: '402',
            placedOn: '19/11/21',
            image:
                'https://image.tmdb.org/t/p/w500/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg',
            title: 'Spider-Man: No Way Home',
            status: 'Delivered',
            date: 'Delivered On: 28/11/21',
          ),
        ],
      ),
    );
  }
}
