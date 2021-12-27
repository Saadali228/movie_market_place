import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'
    as a;
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/cart/pages/check_out.dart';
import 'package:movie_market_place/cart/repository_layer/models/cart_repository_model.dart';
import 'package:movie_market_place/detail_page/pages/detail_page.dart';
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';

class MovieGrid extends StatefulWidget {
  const MovieGrid({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  State<MovieGrid> createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    List<CartRepoModel> movieCartModel =
        context.watch<CartBloc>().state.cartList ?? [];
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return Container(
          color: const Color(0xff1F0C3F),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              child: AnimationLimiter(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width <= mobile
                          ? 60
                          : 40),
                  child: Wrap(
                    children: List.generate(
                      state.movieList.length,
                      (index) => AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 300),
                        child: SlideAnimation(
                          child: a.FadeInAnimation(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        DetailPage.detailPageRoute(
                                            state.movieList[index].id),
                                      );
                                    },
                                    child: Hero(
                                      tag: state.movieList[index].id,
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/w500/" +
                                            state.movieList[index].poster!,
                                        width: 250.0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: cartButton(
                                      context,
                                      state.movieList[index],
                                      movieCartModel.contains(CartRepoModel(
                                        id: state.movieList[index].id,
                                        title: state.movieList[index].title!,
                                        price: state.movieList[index].price!,
                                        image: state.movieList[index].poster!,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget cartButton(BuildContext context, MovieRepoModel movie, bool inCart) {
    return AnimatedSwitcher(
      switchInCurve: Curves.bounceIn,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          alignment: Alignment.centerRight,
          scale: animation,
          child: child,
        );
      },
      duration: const Duration(milliseconds: 500),
      child: !inCart
          ? ElevatedButton.icon(
              key: const Key('1'),
              onPressed: () {
                if (!inCart) {
                  context.read<CartBloc>().add(
                        AddProduct(
                          CartRepoModel(
                            id: movie.id,
                            title: movie.title!,
                            price: movie.price!,
                            image: movie.poster!,
                          ),
                        ),
                      );
                }
              },
              icon: const Icon(Icons.add),
              label: const Text("BUY NOW"),
              style: ButtonStyle(
                //backgroundColor: null,
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
            )
          : ElevatedButton.icon(
              key: const Key('2'),
              onPressed: () {
                if (!inCart) {
                  context.read<CartBloc>().add(
                        AddProduct(
                          CartRepoModel(
                            id: movie.id,
                            title: movie.title!,
                            price: movie.price!,
                            image: movie.poster!,
                            // qty: movieList[index].id,
                            // totalPrice: 1 * movieList[index].id +
                            //     Random().nextDouble(),
                          ),
                        ),
                      );
                }
              },
              icon: const Icon(Icons.check),
              label: const Text("ADDED"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      if (context.read<MovieBloc>().state.pageLoader != PageLoader.loading) {
        context.read<MovieBloc>().add(MovieNextPageFetched());
      }
    }

    if (_isTop) {
      widget.pageController.animateToPage(0,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  bool get _isTop {
    if (!_scrollController.hasClients) return false;
    final minScroll = _scrollController.position.minScrollExtent;
    final currentScroll = _scrollController.offset;
    return _scrollController.position.outOfRange &&
        currentScroll < (minScroll - 50);
  }
}
