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
    return TextField(
      controller: _textEditingController,
      autocorrect: false,
      style: const TextStyle(
        color: Colors.white,
      ),
      onChanged: (text) {
        text.length > 1
            ? BlocProvider.of<SearchBloc>(context).add(
                SearchItemsLoaded(
                  text: text,
                ),
              )
            : null;
      },
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          color: Color(0xff3f3f3f),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xff3f3f3f),
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Colors.purple,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        prefixIcon: const Icon(
          Icons.search,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            BlocProvider.of<SearchBloc>(context).add(
              SearchItemsLoaded(text: ''),
            );
            _textEditingController.text = '';
          },
          child: const Icon(Icons.clear),
        ),
        hintText: 'Search Your Movie',
      ),
    );
  }
}
