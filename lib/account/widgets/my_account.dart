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
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              AccountGrid(
                heading: 'Personal Profile',
                title: 'Vendian',
                subTitle: 'venidan@venturedive.com',
              ),
              SizedBox(width: 20),
              AccountGrid(
                heading: 'Address Book',
                title: 'Vendian',
                subTitle:
                    'Dilkusha Forum, 12th Floor, Tariq Rd, Delhi CHS PECHS, Sindh, Karachi',
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          height: 350,
          width: 1000,
          child: Card(
            color: const Color(0xff361F41),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Orders',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textColumn(
                        'Order #',
                        '1',
                        '2',
                      ),
                      textColumn(
                        'Placed On',
                        '31/12/2021',
                        '19/11/2021',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Items',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Image.network(
                              'https://image.tmdb.org/t/p/w500/c6H7Z4u73ir3cIoCteuhJh7UCAR.jpg',
                              scale: 10,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Image.network(
                              'https://image.tmdb.org/t/p/w500/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg',
                              scale: 10,
                            ),
                          ],
                        ),
                      ),
                      textColumn(
                        'Total',
                        'Rs. 699',
                        'Rs. 999',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget textColumn(
    String text1,
    String text2,
    String text3,
  ) {
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
        const SizedBox(
          height: 20,
        ),
        Text(
          text3,
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
