import 'package:dio/dio.dart';
import 'package:flutter_application_1/airlines_app/models/passenger_response.dart';

class AirlinesDioHelper {
  AirlinesDioHelper._();
  static AirlinesDioHelper airlinesdiohelper = AirlinesDioHelper._();
  Dio dio = Dio();
  // Future<PassengerResponse> getPassengers([int page = 0]) async {
  //   Response response = await dio.get(
  //       'https://api.instantwebtools.net/v1/passenger',
  //       queryParameters: {'size': 10, 'page': page});
  //   PassengerResponse passengerResponse =
  //       PassengerResponse.fromJson(response.data);
  //   return passengerResponse;
  // }
Future<PassengerResponse> getPassengers([int page = 0]) async {
  try {
    Response response = await dio.get(
      'https://api.instantwebtools.net/v1/passenger',
      queryParameters: {'size': 10, 'page': page},
    );
    print("API response: ${response.data}");

    // إذا كانت البيانات فارغة أو فيها مشكلة
    if (response.data == null || response.data['data'] == null) {
      print("No data found in API response");
    } else {
      print("Data found: ${response.data['data'].length} passengers");
    }

    PassengerResponse passengerResponse =
        PassengerResponse.fromJson(response.data);
    return passengerResponse;
  } catch (e) {
    print("Dio error: $e");
    rethrow;
  }
}


}
