import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/search/bloc/search_bloc.dart';
import 'package:movie_market_place/search/repository_layer/models/search_repo_model.dart';
import 'package:movie_market_place/search/widgets/search_item.dart';

class SearchList extends StatelessWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        switch (state.searchStatus) {
          case SearchStatus.initial:
            // state.searchItems?.searchList?.isEmpty ?? 'Search!';
            return const _SearchInitial();
          case SearchStatus.loading:
            return const _SearchLoading();
          case SearchStatus.loaded:
            return _SearchLoaded(
              searchItem: state.searchItems,
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
        style: TextStyle(fontSize: 12),
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
  const _SearchLoaded({
    Key? key,
    required this.searchItem,
  }) : super(key: key);

  final SearchRepoModel? searchItem;

  @override
  Widget build(BuildContext context) {
    return searchItem!.searchList!.isEmpty
        ? const Text('No Movie Found')
        : ListView.builder(
            itemCount: searchItem?.searchList?.length ?? 10,
            itemBuilder: (context, index) {
              return Expanded(
                child: SearchItem(
                  searchItem: searchItem?.searchList?[index],
                ),
              );
            },
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
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
