import 'package:flutter/material.dart';
import 'package:movie_market_place/detail_page/pages/detail_page.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';

class MoviePopular extends StatelessWidget {
  final List<MovieRepoModel> movieList;

  const MoviePopular({Key? key, required this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: mHeight,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 2 / 3,
            maxCrossAxisExtent: 350,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
          ),
          itemBuilder: (BuildContext context, int index) {
            return _popularMovie(context, movieList[index]);
          },
          scrollDirection: Axis.vertical,
          itemCount: movieList.length,
        ),
      ),
    );
  }
}

Widget _popularMovie(BuildContext context, MovieRepoModel item) {
  final width = MediaQuery.of(context).size.width / 2.6;
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => DetailPage(
            id: item.id,
          ),
        ),
      );
    },
    child: Container(
      width: width,
      height: double.infinity,
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 10.0,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SizedBox(
          width: width,
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${item.poster}',
              width: width,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ),
  );
}
