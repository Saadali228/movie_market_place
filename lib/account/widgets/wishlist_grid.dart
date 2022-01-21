import 'package:flutter/material.dart';

double _mobile = 700;

class WishlistGrid extends StatelessWidget {
  const WishlistGrid({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.status,
    required this.date,
  }) : super(key: key);

  final String image;
  final String title;
  final String price;
  final String status;
  final String date;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double mWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: mWidth * 0.7,
      child: Card(
        color: const Color(0xff361F41),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: size.width > _mobile
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      image,
                      scale: 3,
                    ),
                    Flexible(
                      child: Text(
                        'Title: $title',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Price: $price',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Status: $status',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Added on: $date',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      image,
                      scale: 3,
                    ),
                    Text(
                      'Title: $title',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Price: $price',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Status: $status',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Added on: $date',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
