import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';
import 'package:movie_market_place/home_page/widgets/backdrop_image.dart';
import 'package:movie_market_place/home_page/widgets/title_subtitle.dart';
import 'package:movie_market_place/utils/constants.dart';

class HomeBanner extends StatefulWidget {
  final PageController controller;

  const HomeBanner({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int selectedIndex = 0;
  final GlobalKey<AnimatorWidgetState> _title =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _overview =
      GlobalKey<AnimatorWidgetState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        switch (state.movieStatus) {
          case MovieStatus.initial:
            context.read<MovieBloc>().add(
                  MovieFetched(),
                );
            return const _MovieInitial();
          case MovieStatus.loading:
            return const _MovieLoading();
          case MovieStatus.loaded:
            return Stack(
              children: [
                Container(
                  decoration: backgroundGradient,
                ),
                BackDropImage(
                  image: state.movieList[selectedIndex].image,
                ),
                TitleSubtitle(
                  selectedIndex: selectedIndex,
                  controller: widget.controller,
                  onIndexChange: (index) {
                    if (index != selectedIndex) {
                      _title.currentState?.forward();
                      setState(() {
                        selectedIndex = index;
                      });
                    }
                  },
                  titleKey: _title,
                  overviewKey: _overview,
                ),
              ],
            );
          case MovieStatus.error:
          default:
            return const _MovieError();
        }
      },
    );
  }
}

class _MovieInitial extends StatelessWidget {
  const _MovieInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Movies are Empty!', style: TextStyle(fontSize: 64)),
      ],
    );
  }
}

class _MovieLoading extends StatelessWidget {
  const _MovieLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _MovieError extends StatelessWidget {
  const _MovieError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Something went wrong!', style: TextStyle(fontSize: 64)),
      ],
    );
  }
}
