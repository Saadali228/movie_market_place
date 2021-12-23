import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final mHeight = MediaQuery.of(context).size.height;



    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        switch (state.movieStatus) {
          case MovieStatus.initial:
            context.read<MovieBloc>().add(MovieFetched());
            return const _MovieInitial();
          case MovieStatus.loading:
            return const _MovieLoading();
          case MovieStatus.loaded:
            return CarouselSlider(
              options: CarouselOptions(
                height: mHeight * 0.6,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                pauseAutoPlayOnTouch: true,
                viewportFraction: 0.6,
                enlargeCenterPage: true,
              ),
              items: imageSliders(state.movieList, context),
            );
          case MovieStatus.error:
          default:
            return const _MovieError();
        }
      },
    );
  }
  List<Widget> imageSliders(List<MovieRepoModel>movieList, BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    return movieList
      .map((item) =>
      InkWell(
        onTap: () {},
        child: Container(
          width: mWidth * 0.7,
          height: double.infinity,
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Card(
            elevation: 20.0,
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: SizedBox(
              width: mWidth,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Stack(
                  children: [
                    if(item.image==null)
                      const Center(child: Text("Image not found"))
                    else
                    Image.network(
                      'https://image.tmdb.org/t/p/w500/${item.image}',
                      fit: BoxFit.cover, width: mWidth,
                    ),
                    Container(
                      width: mWidth,
                      height: double.infinity,
                      padding: const EdgeInsets.only(
                          left: 16.0, bottom: 20.0),
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [0.1, 0.5, 0.7, 0.9],
                          colors: [
                            Color(0x00000000),
                            Color(0x00000000),
                            Color(0x22000000),
                            Color(0x66000000),
                          ],
                        ),
                      ),
                      child: Text(
                        item.title.toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
  ).toList();
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      ],
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
