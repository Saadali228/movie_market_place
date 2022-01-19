import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'
    as a;
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/cart/repository_layer/models/cart_repository_model.dart';
import 'package:movie_market_place/detail_page/pages/detail_page.dart';
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_genre.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';
import 'package:movie_market_place/search/pages/search_page.dart';

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
  final List<int> numOfYears = [];
  // String dropDownValue = '2021';
  // String dropDownGenre = 'Action';
  // late MovieGenreRepoModel selectedGenre;
  // late int selectedId;
  // List<String> array = ['1', '2', '3', '2021'];

  @override
  void initState() {
    super.initState();
    for (int i = 1990; i < 2022; i++) {
      numOfYears.add(i);
    }
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    // showAlertDialog(BuildContext context) {
    //   Widget okButton = TextButton(
    //     child: const Text("Go Back Home"),
    //     onPressed: () {},
    //   );
    //   AlertDialog alert = AlertDialog(
    //     title: const Text(
    //       "Order Placed",
    //     ),
    //     content: const Text(
    //       "Thanks for ordering",
    //     ),
    //     actions: [
    //       okButton,
    //     ],
    //   );
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return alert;
    //     },
    //   );
    // }

    List<CartRepoModel> movieCartModel =
        context.watch<CartBloc>().state.cartList;
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        List<String> genreList = [];
        //= state.genreList;
        for (int i = 0; i < state.genreList!.length; i++) {
          genreList.add(state.genreList![i].name);
        }
        return Padding(
          padding: const EdgeInsets.only(
            top: 65,
            left: 40,
            right: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SearchPage(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Filter by',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: DropdownButton<int>(
                        // onTap: () {
                        //   print('tappd');

                        //   if (dropDownValue != null) {

                        //   }
                        // },
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        dropdownColor: Colors.purple,
                        value: state.selectedYear,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: numOfYears.map((items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items.toString()));
                        }).toList(),
                        onChanged: (newValue) {
                          // setState(() {
                          //   dropDownValue = newValue.toString();
                          // });
                          if (newValue != null) {
                            print('sent');
                            BlocProvider.of<MovieBloc>(context).add(
                              MovieSelectedReleaseYear(
                                newValue,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    DropdownButton(
                      onTap: () {
                        // print('tappd');
                      },
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      dropdownColor: Colors.purple,
                      value: state.selectedGenre?.name,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: genreList.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (newValue) {
                        final dropDownGenre = newValue.toString();
                        final selectedGenre = state.genreList!.firstWhere(
                            (element) => element.name == dropDownGenre);
                        BlocProvider.of<MovieBloc>(context)
                            .add(MovieGenre(selectedGenre));
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: AnimationLimiter(
                  child: RawScrollbar(
                    thumbColor: Colors.deepPurple,
                    radius: const Radius.circular(25),
                    isAlwaysShown: true,
                    controller: _scrollController,
                    child: GridView.builder(
                        padding: const EdgeInsets.all(0),
                        physics: const BouncingScrollPhysics(),
                        controller: _scrollController,
                        itemCount: state.movieList.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          childAspectRatio: 0.67,
                          //crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 300),
                            child: SlideAnimation(
                              child: a.FadeInAnimation(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    bottom: 8.0,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.topRight,
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
                                            "https://image.tmdb.org/t/p/w500/${state.movieList[index].poster}",
                                            width: 420.0,
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
                                          ),
                                        ),
                                      ),
                                      cartButton(
                                        context,
                                        state.movieList[index],
                                        movieCartModel.contains(CartRepoModel(
                                          id: state.movieList[index].id,
                                          title: state.movieList[index].title!,
                                          price: state.movieList[index].price!,
                                          image: state.movieList[index].poster,
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ],
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
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(140, 35),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(0),
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(140, 35),
                ),
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
