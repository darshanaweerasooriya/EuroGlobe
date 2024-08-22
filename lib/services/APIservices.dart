import 'package:dio/dio.dart';
import 'package:european_countries_app/models/county.dart';

class CountryService {
  final Dio _dio =Dio();

  Future<List<Country>> fetchCountries() async{
    const String url = 'https://restcountries.com/v3.1/region/europe?fields=name,capital,flags,region,languages,population,capital.';
    final response =await _dio.get(url);

    if (response.statusCode == 200){
      final List<dynamic> data = response.data;
      return data.map((json) => Country.fromJson(json)).toList();

    }else{
      throw Exception("Failed to load COuntries");
    }
  }
}