// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:country_app/core/errors/local_auth_error.dart';
import 'package:country_app/core/utils/logger.dart';
import 'package:country_app/core/utils/type_defs.dart';
import 'package:country_app/features/countries/data/models/country_details.dart';
import 'package:country_app/features/countries/data/models/country_model.dart';
import 'package:country_app/features/countries/data/providers/countries_provider.dart';
import 'package:dartz/dartz.dart';

class CountryRepository {
  final CountryProvider countriesProvider;
  CountryRepository({
    required this.countriesProvider,
  });
  Future<CountryErrrOrCountries> getCountries() async {
    try {
      final response = await countriesProvider.getCountries();
      final List<Country> countries = response.map((country) {
        return Country.fromJson(country);
      }).toList();
      return right(countries);
    } catch (e) {
      return left(CountryError(message: e.toString()));
    }
  }

  Future<CountryErrrOrCountryDetails> getCountryDetails(
      {required String country}) async {
    try {
      final response =
          await countriesProvider.getCountryDetails(country: country);
      final CountryDetails details = CountryDetails.fromJson(response[0]);
      logger.e(details);
      return right(details);
    } catch (e) {
      logger.e(e);

      return left(CountryError(message: e.toString()));
    }
  }
}
