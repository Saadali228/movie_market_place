import 'package:flutter/material.dart';
import 'package:movie_market_place/account/widgets/review_grid.dart';

class MyReviews extends StatelessWidget {
  const MyReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'My Reviews',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          ReviewGrid(
            purchasedOn: '31/12/2021',
            image: 'c6H7Z4u73ir3cIoCteuhJh7UCAR.jpg',
            title: 'Eternals',
            star: '⭐⭐⭐⭐',
            remarks: 'Good',
            soldBy: 'DVD Bank',
            emoji: '😀',
            sellerReview: 'Positive',
          ),
          ReviewGrid(
            purchasedOn: '19/11/2021',
            image: '1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg',
            title: 'Spider-Man: No Way Home',
            star: '⭐⭐⭐⭐⭐',
            remarks: 'Excellent',
            soldBy: 'Jumbo Shop',
            emoji: '😀',
            sellerReview: 'Positive',
          ),
          ReviewGrid(
            purchasedOn: '06/09/2021',
            image: 'mFbS5TwN95BcSEfiztdchLgTQ0v.jpg',
            title: 'The Last Duel',
            star: '⭐⭐',
            remarks: 'Bad',
            soldBy: 'Daw Mart',
            emoji: '😞',
            sellerReview: 'Negative',
          ),
        ],
      ),
    );
  }
}
