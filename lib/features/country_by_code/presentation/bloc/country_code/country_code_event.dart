part of 'country_code_bloc.dart';

abstract class CountryCodeEvent {}

class GetCountryByCodeEvent extends CountryCodeEvent {
  final String code;

  GetCountryByCodeEvent({required this.code});
}
