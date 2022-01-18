import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/search/bloc/search_bloc.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: TextField(
        controller: _textEditingController,
        autocorrect: false,
        onChanged: (text) {
          BlocProvider.of<SearchBloc>(context).add(
            SearchItemsLoaded(
              text: text,
            ),
          );
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: GestureDetector(
            onTap: () {
              _textEditingController.text = '';
              BlocProvider.of<SearchBloc>(context).add(
              SearchItemsLoaded(text: ''),
            );
            },
            child: const Icon(Icons.clear),
          ),
          border: InputBorder.none,
          hintText: 'Search!',
        ),
      ),
    );
  }
}
