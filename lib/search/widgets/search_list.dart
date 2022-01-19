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
    return Container();
  }
}

class _SearchLoading extends StatelessWidget {
  const _SearchLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircularProgressIndicator(),
      ),
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
        ? const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'No Movie Found',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
          )
        : Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Color(0xff14141c),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: searchItem?.searchList?.length ?? 10,
              itemBuilder: (context, index) {
                return SearchItem(
                  searchItem: searchItem?.searchList?[index],
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
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
