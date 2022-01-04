
import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/animator_widget.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'
    as a;
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/cart/repository_layer/models/cart_repository_model.dart';
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';
import 'package:movie_market_place/home_page/widgets/dialog_box.dart';
import 'package:movie_market_place/home_page/widgets/size_config.dart';

class TitleSubtitle extends StatelessWidget {
  const TitleSubtitle({
    Key? key,
    required this.controller,
    required this.onIndexChange,
    required this.selectedIndex,
    required this.titleKey,
    required this.overviewKey,
  }) : super(key: key);

  final PageController controller;
  final Function(int index) onIndexChange;
  final int selectedIndex;
  final GlobalKey<AnimatorWidgetState> titleKey;
  final GlobalKey<AnimatorWidgetState> overviewKey;

  @override
  Widget build(BuildContext context) {
    List<CartRepoModel> movieCartModel =
        context.watch<CartBloc>().state.cartList;
    SizeConfig().init(context);
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.addToCartStatus != current.addToCartStatus,
      listener: (context, state) {
        // if (state.addToCartStatus == AddToCartStatus.loaded) {
        //   showDialog(
        //     context: context,
        //     builder: (_) => const DialogBox(
        //       title: 'Movie Added to Cart',
        //       icon: Icons.check_circle,
        //       iconColor: Colors.green,
        //     ),
        //   );
        //   context.read<CartBloc>().add(AddCartInitial());
        // }
        if (state.addToCartStatus == AddToCartStatus.error) {
          showDialog(
            context: context,
            builder: (_) => const DialogBox(
              title: 'Movie Already in Cart',
              icon: Icons.warning_amber_rounded,
              iconColor: Colors.orange,
            ),
          );
          context.read<CartBloc>().add(AddCartInitial());
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 3 * SizeConfig.blockSizeVertical!,
          left: 4 * SizeConfig.blockSizeHorizontal!,
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width *
                    (MediaQuery.of(context).size.width < 1450
                        ? 0.8
                        : (MediaQuery.of(context).size.width < 1650
                            ? 0.4
                            : 0.3)),
                child: FadeInUp(
                  key: titleKey,
                  child: Text(
                    BlocProvider.of<MovieBloc>(context)
                        .state
                        .movieList[selectedIndex]
                        .title!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 5 * SizeConfig.blockSizeVertical!,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width *
                    (MediaQuery.of(context).size.width < 1450
                        ? 0.8
                        : (MediaQuery.of(context).size.width < 1650
                            ? 0.4
                            : 0.3)),
                child: Text(
                  BlocProvider.of<MovieBloc>(context)
                      .state
                      .movieList[selectedIndex]
                      .overview!,
                  maxLines: 6,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  return cartButton(
                    context,
                    state.movieList[selectedIndex],
                    movieCartModel.contains(
                      CartRepoModel(
                        id: state.movieList[selectedIndex].id,
                        title: state.movieList[selectedIndex].title!,
                        price: state.movieList[selectedIndex].price!,
                        image: state.movieList[selectedIndex].poster!,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 24.0,
              ),
              Flexible(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: AnimationLimiter(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: a.SlideAnimation(
                            verticalOffset: 0.0,
                            horizontalOffset: index * 100,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: GestureDetector(
                                onTap: () {
                                  onIndexChange(index);
                                },
                                child: Material(
                                  elevation: 5.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: (index == selectedIndex)
                                          ? Border.all(
                                              color: Colors.black,
                                              width: 5.0,
                                            )
                                          : null,
                                    ),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500/${BlocProvider.of<MovieBloc>(context).state.movieList[index].image}",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Center(
                child: IconButton(
                  onPressed: () {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
        style: const ButtonStyle(
          backgroundColor: null,
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
        ),
      ),
    );
  }
}
