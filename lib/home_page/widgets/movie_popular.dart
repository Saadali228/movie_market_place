import 'package:flutter/material.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';

class MoviePopular extends StatelessWidget {
  final List<MovieRepoModel> movieList;
  const MoviePopular({Key? key, required this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Movies',
            style: TextStyle(
              color: Color(0xfff5f5f5),
              fontWeight: FontWeight.w500,
              fontSize: 25.0,
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: mHeight * 0.3,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 1.4 / 1.7,
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
        ],
      ),
    );
  }
}

Widget _popularMovie(BuildContext context, MovieRepoModel movieList) {
  final width = MediaQuery.of(context).size.width / 2.6;
  return InkWell(
    onTap: () {},
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
              movieList.poster,
              width: width,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ),
  );
}
