import 'package:country_app/core/errors/local_auth_error.dart';
import 'package:country_app/features/countries/data/models/country_details.dart';
import 'package:country_app/features/countries/data/models/country_model.dart';
import 'package:dartz/dartz.dart';

typedef CountryErrrOrCountries = Either<CountryError, List<Country>>;
typedef CountryErrrOrCountryDetails = Either<CountryError, CountryDetails>;
