import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';

class SortButton extends StatelessWidget {
  const SortButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return DropdownButton<SortBy>(
          underline: Container(
            height: 2,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          elevation: 0,
          icon: const Icon(Icons.sort),
          iconDisabledColor: Colors.grey,
          iconEnabledColor: Colors.white,
          iconSize: 20.0,
          isExpanded: true,
          borderRadius: BorderRadius.circular(20.0),
          dropdownColor: const Color(0xff14141c),
          value: state.sortBy,
          onChanged: (sortBy) {
            if (sortBy != null) {
              context.read<MovieBloc>().add(
                    SortedMoviesFetched(
                      sort: sortBy,
                    ),
                  );
            }
          },
          items: SortBy.values.map((sortBy) {
            return DropdownMenuItem(
              value: sortBy,
              child: Text(
                sortBy.name.replaceFirst(
                  sortBy.name.substring(0, 1),
                  sortBy.name.substring(0, 1).toUpperCase(),
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
