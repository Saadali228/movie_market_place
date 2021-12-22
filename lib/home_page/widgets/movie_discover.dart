import 'package:flutter/material.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';

class MovieDiscover extends StatelessWidget {
  const MovieDiscover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width * 0.18;
    final mHeight = MediaQuery.of(context).size.height * 0.08;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      width: mWidth,
      height: mHeight,
      padding: const EdgeInsets.only(
        bottom: 12.0,
        left: 20,
        right: 20,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg',
              fit: BoxFit.cover,
              width: mWidth,
              height: double.infinity,
            ),
          ),
          Container(
            width: mWidth,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Color(0x99ff0000),
                  Color(0x66ff0000),
                  Color(0x66ff0000),
                  Color(0x99ff0000),
                ],
              ),
            ),
            child: const Text(
              'Discover',
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
