part of 'country_code_bloc.dart';




abstract
class CountryCodeByCodeState {}

class Initial extends CountryCodeByCodeState {}

class CountryCodeSuccessful extends CountryCodeByCodeState {
 final CountryModel country;

 CountryCodeSuccessful({required this.country});
}

class CountryCodeLoading extends CountryCodeByCodeState {}

class CountryCodeFailure extends CountryCodeByCodeState {
  final Failure failure;

  CountryCodeFailure(this.failure);
}

