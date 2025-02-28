// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'countries_bloc.dart';

sealed class CountriesEvent extends Equatable {
  const CountriesEvent();

  @override
  List<Object> get props => [];
}

class CountryEventGetCountries extends CountriesEvent {}

class CountryEventGetCountryDetails extends CountriesEvent {
  final String country;
  const CountryEventGetCountryDetails({
    required this.country,
  });
}
