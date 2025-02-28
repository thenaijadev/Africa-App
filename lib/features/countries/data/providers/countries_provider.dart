import 'package:country_app/core/network/api_endpoint.dart';
import 'package:country_app/core/network/dio_client.dart';

class CountryProvider {
  Future<List<dynamic>> getCountries() async {
    try {
      final response = await DioClient.instance.get(
        queryParameters: {
          "status": "true",
          "fields": "name,languages,capital,flags"
        },
        path: ApiRoutes.countries,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> getCountryDetails({required String country}) async {
    try {
      final response = await DioClient.instance.get(
        path: '${ApiRoutes.countryDetails}/$country',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
