import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_market_place/cart/pages/cart_page.dart';
import 'package:movie_market_place/detail_page/repository_layer/models/movie_detail_repo_model.dart';
import 'package:movie_market_place/home_page/widgets/cart_button.dart';
import 'package:movie_market_place/home_page/widgets/logo_widget.dart';
import 'package:movie_market_place/home_page/widgets/size_config.dart';
import 'package:movie_market_place/utils/constants.dart';
import 'package:http/http.dart' as http;

class MovieDetailPage extends StatelessWidget {
  final MovieDetailRepoModel movieDetail;
  const MovieDetailPage({Key? key, required this.movieDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/634649/credits?api_key=2e3196b2667f3f54ded1d98d15b5020d');
    Future<http.Response> fetchAlbum() {
      return http.get(url);
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: 3 * SizeConfig.blockSizeHorizontal!,
            ),
            const LogoWidget(),
          ],
        ),
        actions: [
          Builder(builder: (context) {
            return CartButton(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          }),
          SizedBox(
            width: 3 * SizeConfig.blockSizeHorizontal!,
          ),
        ],
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      endDrawer: const CartDrawer(),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: backgroundGradient,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 78.0,
              left: 48.0,
              right: 48.0,
              bottom: 48.0,
            ),
            child: Material(
              elevation: 6.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: const Color(0xff361F41),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    children: [
                      Image.network(
                        "https://image.tmdb.org/t/p/w780/${movieDetail.poster}",
                      ),
                      const SizedBox(
                        width: 32.0,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  movieDetail.title!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 5 * SizeConfig.blockSizeVertical!,
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                  label: const Text("RENT NOW FOR 99 Rs."),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 24.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Action",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100,
                                      fontSize:
                                          2.2 * SizeConfig.blockSizeVertical!,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height:
                                          2.2 * SizeConfig.blockSizeVertical!,
                                      width: 2.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Comedy",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100,
                                      fontSize:
                                          2.2 * SizeConfig.blockSizeVertical!,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height:
                                          2.2 * SizeConfig.blockSizeVertical!,
                                      width: 2.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Drama",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100,
                                      fontSize:
                                          2.2 * SizeConfig.blockSizeVertical!,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Text(
                                movieDetail.overview!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 2 * SizeConfig.blockSizeVertical!,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Viewer Rating:",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize:
                                        1.8 * SizeConfig.blockSizeVertical!,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: const [
                                    CircularProgressIndicator(
                                      value: 3.4,
                                    ),
                                    Text(
                                      // (movieDetail.voteAverage!).toStringAsFixed(1),
                                      '1',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            Text(
                              "Cast",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                                fontSize: 2.2 * SizeConfig.blockSizeVertical!,
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Expanded(
                              flex: 7,
                              child: FutureBuilder<http.Response>(
                                  future: fetchAlbum(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      var data = jsonDecode(
                                          snapshot.data!.body)["cast"];
                                      return SingleChildScrollView(
                                        child: Wrap(
                                          children: List.generate(
                                            12,
                                            (index) => Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 16.0,
                                                right: 16.0,
                                              ),
                                              child: Material(
                                                elevation: 5.0,
                                                child: Image.network(
                                                  "https://image.tmdb.org/t/p/w185${data[index]['profile_path']}",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
