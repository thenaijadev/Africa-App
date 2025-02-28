// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'countries_bloc.dart';

sealed class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

final class CountryInitial extends CountryState {}

class CountryStateIsLoading extends CountryState {}

class CountryStateError extends CountryState {
  final CountryError error;
  const CountryStateError({
    required this.error,
  });
}

class CountryStateCountries extends CountryState {
  final List<Country> countries;
  const CountryStateCountries({
    required this.countries,
  });
}

class CountryStateCountryDetails extends CountryState {
  final CountryDetails details;
  const CountryStateCountryDetails({
    required this.details,
  });
}
