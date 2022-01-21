import 'package:flutter/material.dart';

class MyReviews extends StatelessWidget {
  const MyReviews({Key? key}) : super(key: key);

  Widget starIcon() {
    return const Icon(
      Icons.star,
      color: Colors.yellow,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width);
    double _mobile = 1100;
    final isMobile = size.width < _mobile ? true : false;
    Widget buildColumn() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'Sold by',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Movie Mart',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Your Seller review',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.network(
                'https://laz-img-cdn.alicdn.com/tfs/TB1JWNYdLDH8KJjy1XcXXcpdXXa-48-48.png',
                scale: 2,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Positive',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget buildReview(
      purchased,
      imageUrl,
      movieName,
      reviewText, {
      rating = false,
    }) {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SizedBox(
          height: isMobile ? 275 : 225,
          // height: 225,
          width: isMobile ? size.width * 0.78 : size.width * 0.75,
          child: Card(
            color: const Color(0xff361F41),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        purchased,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Your product rating & review:',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.network(
                            imageUrl,
                            scale: 4,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movieName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  starIcon(),
                                  starIcon(),
                                  starIcon(),
                                  rating
                                      ? const Icon(
                                          Icons.star_border,
                                          color: Colors.yellow,
                                        )
                                      : starIcon(),
                                  rating
                                      ? const Icon(
                                          Icons.star_border,
                                          color: Colors.yellow,
                                        )
                                      : starIcon(),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      reviewText,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (isMobile) buildColumn(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (!isMobile)
                    const SizedBox(
                      width: 300,
                    ),
                  if (!isMobile) buildColumn(),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Reviews',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          buildReview(
            'Purchased on 10 Jan 2022',
            'https://image.tmdb.org/t/p/w500/c6H7Z4u73ir3cIoCteuhJh7UCAR.jpg',
            'Eternals',
            'Excellent',
          ),
          buildReview(
            'Purchased on 20 Dec 2021',
            'https://image.tmdb.org/t/p/w500/nlysrDR67rnt0DGW3FmnhC1lOdq.jpg',
            'Jack Reacher',
            'Good',
            rating: true,
          ),
        ],
      ),
    );
  }
}
