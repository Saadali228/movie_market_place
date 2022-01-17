part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {}

class SearchItemsLoaded extends SearchEvent {
  @override
  List<Object?> get props => [];
}
