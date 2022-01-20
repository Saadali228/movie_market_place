import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';

class SortButton extends StatelessWidget {
  const SortButton({Key? key, required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return DropdownButtonHideUnderline(
          child: DropdownButton<SortBy>(
            elevation: 0,
            icon: const Icon(Icons.sort),
            iconDisabledColor: Colors.grey,
            iconEnabledColor: Colors.white,
            iconSize: 20.0,
            // isExpanded: true,
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
                scrollController.animateTo(0.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              }
            },
            items: SortBy.values.map((sortBy) {
              return DropdownMenuItem(
                alignment: Alignment.center,
                value: sortBy,
                child: Text(
                  sortBy.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
