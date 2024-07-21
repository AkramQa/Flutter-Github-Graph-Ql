part of 'fetch_list_bloc.dart';

abstract class FetchListState {}

class Initial extends FetchListState {}

class FetchListSuccessful extends FetchListState {
  final List<CountryModel> countries;
  FetchListSuccessful(this.countries);
}

class FetchListLoading extends FetchListState {}

class FetchListFailure extends FetchListState {
  final Failure failure;

  FetchListFailure(this.failure);
}
