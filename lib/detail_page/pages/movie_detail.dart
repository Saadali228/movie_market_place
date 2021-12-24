import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/cart/pages/cart_page.dart';
import 'package:movie_market_place/cart/repository_layer/models/cart_repository_model.dart';
import 'package:movie_market_place/detail_page/repository_layer/models/movie_detail_repo_model.dart';
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';
import 'package:movie_market_place/home_page/widgets/cart_button.dart';
import 'package:movie_market_place/home_page/widgets/logo_widget.dart';
import 'package:movie_market_place/home_page/widgets/size_config.dart';
import 'package:movie_market_place/utils/constants.dart';
import 'package:http/http.dart' as http;

double tablet = 1050;
double mobile = 750;

class MovieDetailPage extends StatelessWidget {
  final MovieDetailRepoModel movieDetail;

  const MovieDetailPage({Key? key, required this.movieDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Widget isRow() {
      if (size.width < tablet) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                movieDetail.title!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 5 * SizeConfig.blockSizeVertical!,
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.read<CartBloc>().add(
                      AddProduct(
                        CartRepoModel(
                          id: movieDetail.id,
                          title: movieDetail.title!,
                          price: movieDetail.price!,
                          image: movieDetail.poster!,
                        ),
                      ),
                    );
              },
              icon: const Icon(Icons.add),
              label: const Text(
                "BUY NOW",
              ),
            ),
          ],
        );
      } else {
        return Row(
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
              onPressed: () {
                context.read<CartBloc>().add(
                      AddProduct(
                        CartRepoModel(
                          id: movieDetail.id,
                          title: movieDetail.title!,
                          price: movieDetail.price!,
                          image: movieDetail.poster!,
                        ),
                      ),
                    );
              },
              icon: const Icon(Icons.add),
              label: const Text(
                "BUY NOW",
              ),
            ),
          ],
        );
      }
    }

    var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/${movieDetail.id}/credits?api_key=2e3196b2667f3f54ded1d98d15b5020d',
    );
    Future<http.Response> fetchAlbum() {
      return http.get(
        url,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: 3 * SizeConfig.blockSizeHorizontal!,
            ),
            if (MediaQuery.of(context).size.width < mobile)
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                ),
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
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          return BlocListener<CartBloc, CartState>(
            listenWhen: (previous, current) =>
                previous.addToCartStatus != current.addToCartStatus,
            listener: (context, state) {
              if (state.addToCartStatus == AddToCartStatus.loaded) {
                Scaffold.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Movie Added to Cart'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
                context.read<CartBloc>().add(AddCartInitial());
              }
              if (state.addToCartStatus == AddToCartStatus.error) {
                Scaffold.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Movie Already in Cart'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
                context.read<CartBloc>().add(AddCartInitial());
              }
            },
            child: Stack(
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
                        child: size.width < mobile
                            ? SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      "https://image.tmdb.org/t/p/w780/${movieDetail.poster}",
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          color: const Color(0xff322043),
                                          alignment: Alignment.center,
                                          child: const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                        );
                                      },
                                      height: size.height * 0.5,
                                    ),
                                    const SizedBox(
                                      width: 32.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //
                                        isRow(),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 24.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Action",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 2.2 *
                                                      SizeConfig
                                                          .blockSizeVertical!,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 2.2 *
                                                      SizeConfig
                                                          .blockSizeVertical!,
                                                  width: 2.0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                "Comedy",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 2.2 *
                                                      SizeConfig
                                                          .blockSizeVertical!,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 2.2 *
                                                      SizeConfig
                                                          .blockSizeVertical!,
                                                  width: 2.0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                "Drama",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 2.2 *
                                                      SizeConfig
                                                          .blockSizeVertical!,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          movieDetail.overview!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 2 *
                                                SizeConfig.blockSizeVertical!,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 24.0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Price",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 2.5 *
                                                    SizeConfig
                                                        .blockSizeVertical!,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 16.0,
                                            ),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 50,
                                                  width: 50,
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: 3.4,
                                                  ),
                                                ),
                                                Text(
                                                  // (movieDetail.voteAverage!).toStringAsFixed(1),
                                                  '\$${movieDetail.price!.toString()}',
                                                  style: const TextStyle(
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
                                            fontSize: 2.2 *
                                                SizeConfig.blockSizeVertical!,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16.0,
                                        ),
                                        FutureBuilder<http.Response>(
                                            future: fetchAlbum(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                var data = jsonDecode(snapshot
                                                    .data!.body)["cast"];
                                                return Wrap(
                                                  children: List.generate(
                                                    12,
                                                    (index) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        bottom: 16.0,
                                                        right: 16.0,
                                                      ),
                                                      child: Material(
                                                        elevation: 5.0,
                                                        child: Image.network(
                                                          "https://image.tmdb.org/t/p/w185${data[index]['profile_path']}",
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return const SizedBox();
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Row(
                                children: [
                                  Image.network(
                                    "https://image.tmdb.org/t/p/w780/${movieDetail.poster}",
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: const Color(0xff322043),
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 32.0,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //
                                        isRow(),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 24.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Action",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 2.2 *
                                                      SizeConfig
                                                          .blockSizeVertical!,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 2.2 *
                                                      SizeConfig
                                                          .blockSizeVertical!,
                                                  width: 2.0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                "Comedy",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 2.2 *
                                                      SizeConfig
                                                          .blockSizeVertical!,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 2.2 *
                                                      SizeConfig
                                                          .blockSizeVertical!,
                                                  width: 2.0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                "Drama",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 2.2 *
                                                      SizeConfig
                                                          .blockSizeVertical!,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          movieDetail.overview!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 2 *
                                                SizeConfig.blockSizeVertical!,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 24.0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Price",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 1.8 *
                                                    SizeConfig
                                                        .blockSizeVertical!,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 16.0,
                                            ),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                const CircularProgressIndicator(
                                                  value: 3.4,
                                                ),
                                                Text(
                                                  // (movieDetail.voteAverage!).toStringAsFixed(1),
                                                  '\$${movieDetail.price!.toString()}',
                                                  style: const TextStyle(
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
                                            fontSize: 2.2 *
                                                SizeConfig.blockSizeVertical!,
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
                                                  var data = jsonDecode(snapshot
                                                      .data!.body)["cast"];
                                                  return SingleChildScrollView(
                                                    child: Wrap(
                                                      children: List.generate(
                                                        12,
                                                        (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            bottom: 16.0,
                                                            right: 16.0,
                                                          ),
                                                          child: Material(
                                                            elevation: 5.0,
                                                            child:
                                                                Image.network(
                                                              "https://image.tmdb.org/t/p/w185${data[index]['profile_path']}",
                                                              errorBuilder:
                                                                  (context,
                                                                      error,
                                                                      stackTrace) {
                                                                return const SizedBox();
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
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
        },
      ),
    );
  }
}
