import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/detail_page/bloc/movie_detail_bloc.dart';
import 'package:movie_market_place/detail_page/pages/movie_detail.dart';
import 'package:movie_market_place/detail_page/repository_layer/models/movie_detail_repo_model.dart';

class DetailPage extends StatelessWidget {
  // static const detailPageRoute = '/movie';
  static String detailPageRoute(int id) {
    return '/movie?id=$id';
  }

  final int id;

  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailBloc(
        RepositoryProvider.of(context),
        id,
      ),
      child: DetailView(
        id: id,
      ),
    );
  }
}

class DetailView extends StatelessWidget {
  final int id;

  const DetailView({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff2d2d2d),
        body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            switch (state.movieDetailStatus) {
              case MovieDetailStatus.initial:
                context.read<MovieDetailBloc>().add(
                      MovieDetailFetched(),
                    );
                return const _MovieDetailInitial();
              case MovieDetailStatus.loading:
                return const _MovieDetailLoading();
              case MovieDetailStatus.loaded:
                return _MovieDetailLoaded(
                  movieDetail: state.movieDetails!,
                );
              case MovieDetailStatus.error:
              default:
                return const _MovieDetailError();
            }
          },
        ),
      ),
    );
  }
}

class _MovieDetailInitial extends StatelessWidget {
  const _MovieDetailInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Movie is Empty!', style: TextStyle(fontSize: 64)),
      ],
    );
  }
}

class _MovieDetailLoading extends StatelessWidget {
  const _MovieDetailLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _MovieDetailLoaded extends StatelessWidget {
  final MovieDetailRepoModel movieDetail;

  const _MovieDetailLoaded({Key? key, required this.movieDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieDetailPage(
      movieDetail: movieDetail,
    );
  }
}

class _MovieDetailError extends StatelessWidget {
  const _MovieDetailError({Key? key}) : super(key: key);

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
