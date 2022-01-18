import 'package:flutter/material.dart';
import 'package:movie_market_place/search/widgets/search_list.dart';
import 'package:movie_market_place/search/widgets/search_textfield.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SearchTextField(),
        SearchList(),
      ],
    );
  }
}
