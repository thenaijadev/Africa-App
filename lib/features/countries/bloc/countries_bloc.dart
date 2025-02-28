import 'package:bloc/bloc.dart';
import 'package:country_app/core/errors/local_auth_error.dart';
import 'package:country_app/features/countries/data/models/country_details.dart';
import 'package:country_app/features/countries/data/models/country_model.dart';
import 'package:country_app/features/countries/data/repositories/countries_repository.dart';
import 'package:equatable/equatable.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountryBloc extends Bloc<CountriesEvent, CountryState> {
  final CountryRepository repository;
  CountryBloc({required this.repository}) : super(CountryInitial()) {
    on<CountryEventGetCountries>((event, emit) async {
      emit(CountryStateIsLoading());
      final res = await repository.getCountries();
      res.fold((CountryError error) {
        emit(CountryStateError(error: error));
      }, (List<Country> countries) {
        emit(CountryStateCountries(countries: countries));
      });
    });

    on<CountryEventGetCountryDetails>((event, emit) async {
      emit(CountryStateIsLoading());
      final res = await repository.getCountryDetails(country: event.country);
      res.fold((CountryError error) {
        emit(CountryStateError(error: error));
      }, (CountryDetails details) {
        emit(CountryStateCountryDetails(details: details));
      });
    });
  }
}
