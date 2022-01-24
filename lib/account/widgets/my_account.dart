import 'package:flutter/material.dart';
import 'package:movie_market_place/account/widgets/account_grid.dart';

double _scroll = 550;

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double mWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'My Account',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            direction: Axis.horizontal,
            children: const [
              AccountGrid(
                heading: 'Personal Profile',
                title: 'Vendian',
                subTitle: 'venidan@venturedive.com',
              ),
              AccountGrid(
                heading: 'Address Book',
                title: 'Vendian',
                subTitle:
                    'Dilkusha Forum, 12th Floor, Tariq Rd, Delhi CHS PECHS, Sindh, Karachi',
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 350,
            width: mWidth * 0.7,
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
                    size.width > _scroll
                        ? textColumns()
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: textColumns(),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row textColumns() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textColumn(
          'Order #',
          '319',
          '402',
          '266',
          '241',
          '198',
        ),
        textColumn(
          'Placed On',
          '31/12/2021',
          '19/11/2021',
          '06/09/2021',
          '28/08/2021',
          '23/08/2021',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                scale: 12,
              ),
              const SizedBox(
                height: 15,
              ),
              Image.network(
                  'https://image.tmdb.org/t/p/w500/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg',
                  scale: 12),
              const SizedBox(
                height: 15,
              ),
              Image.network(
                'https://image.tmdb.org/t/p/w500/mFbS5TwN95BcSEfiztdchLgTQ0v.jpg',
                scale: 12,
              ),
              const SizedBox(
                height: 15,
              ),
              Image.network(
                'https://image.tmdb.org/t/p/w500/zlj0zHo67xXoj7hvwGtaKRkSdBV.jpg',
                scale: 12,
              ),
              const SizedBox(
                height: 15,
              ),
              Image.network(
                'https://image.tmdb.org/t/p/w500/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg',
                scale: 12,
              ),
            ],
          ),
        ),
        textColumn(
          'Status',
          'Delivered',
          'Delivered',
          'Refunded',
          'Cancelled',
          'Cancelled',
        ),
        textColumn(
          'Total',
          '\$73',
          '\$84',
          '\$75',
          '\$64',
          '\$77',
        ),
      ],
    );
  }

  Widget textColumn(
    String text1,
    String text2,
    String text3,
    String text4,
    String text5,
    String text6,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
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
              fontSize: 14,
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
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            text4,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            text5,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            text6,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
