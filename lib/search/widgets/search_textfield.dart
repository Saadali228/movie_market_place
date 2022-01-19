import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/search/bloc/search_bloc.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textEditingController = TextEditingController();
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
        isDense: true,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        suffixIcon: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            BlocProvider.of<SearchBloc>(context).add(
              SearchItemsLoaded(text: ''),
            );
            _textEditingController.text = '';
          },
          child: const Icon(
            Icons.clear,
            color: Colors.grey,
          ),
        ),
        hintText: 'Search Your Movie',
      ),
    );
  }
}
