import 'package:dio/dio.dart';
import 'package:doa/doa.dart';

abstract class Services {
  static Future<Doa?> getRandomDoa() async {
    try {
      final response = await Dio()
          .get('https://doa-doa-api-ahmadramadhan.fly.dev/api/doa/v1/random');

      if (response.statusCode == 200) {
        return Doa(
          id: response.data[0]['id'],
          doa: response.data[0]['doa'],
          ayat: response.data[0]['ayat'],
          latin: response.data[0]['latin'],
          artinya: response.data[0]['artinya'],
        );
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
