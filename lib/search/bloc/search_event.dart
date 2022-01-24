part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {}

class SearchItemsLoaded extends SearchEvent {
  SearchItemsLoaded({required this.text});

  final String text;

  @override
  List<Object?> get props => [text];
  
}

class SearchItemInitial extends SearchEvent {
  SearchItemInitial();

  @override
  List<Object?> get props => [];
  
}