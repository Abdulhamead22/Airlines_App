import 'package:flutter/material.dart';
import 'package:flutter_application_1/airlines_app/airlines_dio_helper.dart';
import 'package:flutter_application_1/airlines_app/models/passenger_response.dart';

//هوا الي بربط بين  ui and data
class AirlinesProvider extends ChangeNotifier {
  AirlinesProvider() {
    getAllAirlines();
  }
   int page = 0;
  // getMorePassenger() {
  //   page++;
  //   getAllAirlines();
  // }

   List<Passenger>? passengers;
  // getAllAirlines() async {
  //   PassengerResponse passengerResponse =
  //       await AirlinesDioHelper.airlinesdiohelper.getPassengers(page);
  //   // passengers
  //   //     ?.addAll(passengerResponse.data ?? []); //كل مرة بجيب بيانات جديدة خزنها
  //   if (passengers == null) {
  //   passengers = passengerResponse.data ?? [];
  // } else {
  //   passengers!.addAll(passengerResponse.data ?? []);
  // }
  //   notifyListeners(); //ينبه انو صار تغييرات
  // }
getAllAirlines() async {
  try {
    print("Fetching passengers for page $page");
    PassengerResponse passengerResponse =
        await AirlinesDioHelper.airlinesdiohelper.getPassengers(page);

    if (passengerResponse.data != null) {
      print("Received ${passengerResponse.data!.length} passengers");
    } else {
      print("No data received");
    }

    passengers ??= [];
    passengers!.addAll(passengerResponse.data ?? []);

    // تأكد من البيانات المخزنة في passengers
    print("Total passengers: ${passengers?.length}");
    
    notifyListeners();
  } catch (e) {
    print("Error fetching passengers: $e");
  }
}


}
