import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'
    as a;
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';

class MovieGrid extends StatefulWidget {
  const MovieGrid({
    Key? key,
  }) : super(key: key);

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
    return BlocBuilder<MovieBloc, MovieState>(
  builder: (context, state) {
    return Container(
      color: const Color(0xff1F0C3F),
      child: Center(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: AnimationLimiter(
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
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500/" +
                              state.movieList[index].poster!,
                          width: 250.0,
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
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

