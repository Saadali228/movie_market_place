import 'package:flutter/material.dart';
import 'package:movie_market_place/search/repository_layer/models/search_item_repo_model.dart';

class DropDownItem extends StatelessWidget {
  const DropDownItem({ Key? key, required this.searchItem }) : super(key: key);

  final SearchItemRepoModel? searchItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(children: const [
        
      ],),
    );
  }
}