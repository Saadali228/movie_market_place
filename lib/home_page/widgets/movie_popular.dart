import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/cart/repository_layer/models/cart_repository_model.dart';
import 'package:movie_market_place/detail_page/pages/detail_page.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';
import 'dart:math';

class MoviePopular extends StatelessWidget {
  final List<MovieRepoModel> movieList;

  const MoviePopular({Key? key, required this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.addToCartStatus != current.addToCartStatus,
      listener: (context, state) {
        if (state.addToCartStatus == AddToCartStatus.loaded) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item Added'),
              duration: Duration(milliseconds: 300),
            ),
          );
          context.read<CartBloc>().add(AddCartInitial());
        }
        if (state.addToCartStatus == AddToCartStatus.error) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item Not Added'),
              duration: Duration(milliseconds: 300),
            ),
          );
          context.read<CartBloc>().add(AddCartInitial());
        }
      },
      child: Padding(
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
              return Column(
                children: [
                  _popularMovie(context, movieList[index]),
                  InkWell(
                    onTap: () => context.read<CartBloc>().add(
                          AddProduct(
                            CartRepoModel(
                              id: movieList[index].id,
                              title: movieList[index].title,
                              price:
                                  movieList[index].id + Random().nextDouble(),
                              qty: movieList[index].id,
                              totalPrice: 1 * movieList[index].id +
                                  Random().nextDouble(),
                            ),
                          ),
                        ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              "Add to cart",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Icon(
                              Icons.add_shopping_cart,
                              color: Colors.black,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            scrollDirection: Axis.vertical,
            itemCount: movieList.length,
          ),
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
