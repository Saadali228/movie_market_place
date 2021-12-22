import 'package:flutter/material.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';

class MovieDiscover extends StatelessWidget {
  final List<MovieRepoModel> movieList;

  const MovieDiscover({Key? key, required this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {},
      child: Container(
        width: mWidth * 0.3,
        height: mHeight * 0.2,
        padding: const EdgeInsets.only(
          bottom: 12.0,
          left: 20,
          right: 20,
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 20.0,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SizedBox(
            width: mWidth,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Stack(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg',
                    fit: BoxFit.cover,
                    width: mWidth,
                    height: double.infinity,
                  ),
                  Container(
                    width: mWidth,
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
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
            ),
          ),
        ),
      ),
    );
  }
}
