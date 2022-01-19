import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';

class SortButton extends StatelessWidget {
  const SortButton({Key? key, required this.scrollController}) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return DropdownButton<SortBy>(
          value: state.sortBy,
          onChanged: (sortBy) {
            if (sortBy != null) {
              context.read<MovieBloc>().add(
                    SortedMoviesFetched(
                      sort: sortBy,
                    ),
                  );
                  scrollController.animateTo(
                    0.0, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
            }
          },
          items: SortBy.values.map((sortBy) {
            return DropdownMenuItem(
              value: sortBy,
              child: Text(
                sortBy.name,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
