import 'package:flutter/material.dart';
import 'package:movie_market_place/account/widgets/wishlist_grid.dart';

class MyWishlist extends StatelessWidget {
  const MyWishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'My Wishlist',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          WishlistGrid(
            image:
                'https://image.tmdb.org/t/p/w500/vIgyYkXkg6NC2whRbYjBD7eb3Er.jpg',
            title: 'Venom: Let There Be Carnage',
            price: '\$71',
            status: 'In Stock',
            date: '04/01/22',
          ),
          SizedBox(height: 20.0),
          WishlistGrid(
            image:
                'https://image.tmdb.org/t/p/w500/dK12GIdhGP6NPGFssK2Fh265jyr.jpg',
            title: 'Red Notice',
            price: '\$68',
            status: 'In Stock',
            date: '17/12/21',
          ),
        ],
      ),
    );
  }
}
