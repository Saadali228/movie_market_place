import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/search/bloc/search_bloc.dart';
import 'package:movie_market_place/search/repository_layer/models/search_repo_model.dart';
import 'package:movie_market_place/search/widgets/dropdown_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        switch (state.searchStatus) {
          case SearchStatus.initial:
            context.read<SearchBloc>().add(
                  SearchItemsLoaded(text: state.query),
                );
            return const _SearchInitial();
          case SearchStatus.loading:
            return const _SearchLoading();
          case SearchStatus.loaded:
            return _SearchLoaded(
              searchItems: state.searchItems,
              query: state.query,
            );
          case SearchStatus.error:
          default:
            return const _SearchError();
        }
      },
    );
  }
}

class _SearchInitial extends StatelessWidget {
  const _SearchInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Search Your Favourite Movie!',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}

class _SearchLoading extends StatelessWidget {
  const _SearchLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _SearchLoaded extends StatelessWidget {
  const _SearchLoaded(
      {Key? key, required this.query, required this.searchItems})
      : super(key: key);

  final String? query;
  final SearchRepoModel? searchItems;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: GestureDetector(
          onTap: () => BlocProvider.of<SearchBloc>(context).add(
            SearchItemsLoaded(text: ''),
          ),
          child: const Icon(Icons.clear),
        ),
        border: InputBorder.none,
        hintText: 'Search!',
      ),
      value: query ?? '',
      isExpanded: true,
      onChanged: (text) {
        BlocProvider.of<SearchBloc>(context).add(
          SearchItemsLoaded(
            text: text.toString(),
          ),
        );
      },
      onTap: () {},
      items: List.generate(
        searchItems?.searchList?.length ?? 10,
        (index) {
          return DropdownMenuItem(
            child: DropDownItem(
              searchItem: searchItems?.searchList?[index],
            ),
          );
        },
      ),
    );
  }
}

class _SearchError extends StatelessWidget {
  const _SearchError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Something Went Wrong!',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}
