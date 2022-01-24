import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'
    as a;
import 'package:movie_market_place/account/bloc/account_bloc.dart';
import 'package:movie_market_place/account/repository_layer/models/account_repo_model.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/cart/repository_layer/models/cart_repository_model.dart';
import 'package:movie_market_place/detail_page/pages/detail_page.dart';
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';
import 'package:movie_market_place/home_page/widgets/sort_button.dart';
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

  @override
  void initState() {
    super.initState();
    // numOfYears.add('Any');
    for (int i = 1990; i < 2022; i++) {
      numOfYears.add(i);
    }
    numOfYears.add(2022);
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    double _mobile = 400;
    final size = MediaQuery.of(context).size;

    List<CartRepoModel> movieCartModel =
        context.watch<CartBloc>().state.cartList;
    List<AccountRepoModel> movieAccountModel =
        context.watch<AccountBloc>().state.wishList;
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        List<String> genreList = [];
        genreList.add('Any');
        for (int i = 0; i < state.genreList!.length; i++) {
          genreList.add(state.genreList![i].name);
        }
        return Padding(
          padding: EdgeInsets.only(
            top: size.width < _mobile ? 130 : 80,
            left: 40,
            right: 40,
          ),
          child: RawScrollbar(
            thumbColor: Colors.deepPurple,
            radius: const Radius.circular(25),
            isAlwaysShown: true,
            controller: _scrollController,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                const SliverToBoxAdapter(child: SearchPage()),
                const SliverToBoxAdapter(child: SizedBox(height: 10)),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DropdownButton<int>(
                          underline: Container(
                            height: 2,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          elevation: 0,
                          icon: const Icon(Icons.date_range),
                          iconDisabledColor: Colors.grey,
                          iconEnabledColor: Colors.white,
                          iconSize: 18.0,
                          // isExpanded: true,
                          borderRadius: BorderRadius.circular(20.0),
                          dropdownColor: const Color(0xff14141c),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          value: state.selectedYear ?? 2022,
                          items: numOfYears.map((items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items.toString()));
                          }).toList(),
                          onChanged: (newValue) {
                            if (newValue != null) {
                              BlocProvider.of<MovieBloc>(context).add(
                                MovieSelectedReleaseYear(
                                  int.parse(newValue.toString()),
                                ),
                              );
                            }
                          },
                        ),
                        DropdownButton(
                          underline: Container(
                            height: 2,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          elevation: 0,
                          icon: const Icon(Icons.category),
                          iconDisabledColor: Colors.grey,
                          iconEnabledColor: Colors.white,
                          iconSize: 18.0,
                          // isExpanded: true,
                          borderRadius: BorderRadius.circular(20.0),
                          dropdownColor: const Color(0xff14141c),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          value: state.selectedGenre?.name ?? 'Any',
                          items: genreList.map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                          onChanged: (newValue) {
                            final dropDownGenre = newValue.toString();
                            if (newValue != 'Any') {
                              final selectedGenre = state.genreList!.firstWhere(
                                  (element) => element.name == dropDownGenre);

                              BlocProvider.of<MovieBloc>(context)
                                  .add(MovieGenre(selectedGenre));
                            }
                          },
                        ),
                        const SortButton(),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 10)),
                AnimationLimiter(
                  child: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      childAspectRatio: 0.67,
                      mainAxisSpacing: 10,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (context
                                .read<AccountBloc>()
                                .state
                                .deleteFromWishListStatus ==
                            DeleteFromWishListStatus.loaded) {
                          context.read<AccountBloc>().add(
                                SetDeleteWishToInitial(),
                              );
                        }
                        final findMovie = movieAccountModel
                            .where((element) =>
                                element.id == state.movieList[index].id)
                            .toList();
                        // if (findMovie.isNotEmpty) {
                        //   print(findMovie.first);
                        // }
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
                                      movieCartModel.contains(
                                        CartRepoModel(
                                          id: state.movieList[index].id,
                                          title: state.movieList[index].title!,
                                          price: state.movieList[index].price!,
                                          image: state.movieList[index].poster,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      child: wishButton(
                                        context,
                                        state.movieList[index],
                                        findMovie.isNotEmpty,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: state.movieList.length,
                    ),
                  ),
                ),
              ],
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

  Widget wishButton(
    BuildContext context,
    MovieRepoModel movie,
    bool inWishList,
  ) {
    return AnimatedSwitcher(
      switchInCurve: Curves.bounceIn,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          alignment: Alignment.centerLeft,
          scale: animation,
          child: child,
        );
      },
      duration: const Duration(milliseconds: 500),
      child: !inWishList
          ? IconButton(
              icon: const Icon(
                Icons.favorite_outlined,
                color: Colors.purple,
                size: 35,
              ),
              key: const Key('1'),
              onPressed: () {
                // print(inWishList);
                context.read<AccountBloc>().add(
                      WishAdded(
                        AccountRepoModel(
                          id: movie.id,
                          title: movie.title!,
                          price: movie.price!,
                          image: movie.poster!,
                        ),
                      ),
                    );
                // print(inWishList);
              },
            )
          : IconButton(
              icon: const Icon(
                Icons.favorite_outlined,
                color: Colors.green,
                size: 35,
              ),
              key: const Key('2'),
              onPressed: () {
                context.read<AccountBloc>().add(
                      WishDeleted(
                        AccountRepoModel(
                          id: movie.id,
                          title: movie.title!,
                          price: movie.price!,
                          image: movie.poster!,
                        ),
                      ),
                    );
              },
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
