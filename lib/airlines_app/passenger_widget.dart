import 'package:flutter/material.dart';
import 'package:flutter_application_1/airlines_app/models/passenger_response.dart';

class PassengerWidget extends StatelessWidget {
  const PassengerWidget(this.passenger, {super.key});
  final Passenger passenger;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      color: Colors.blueGrey,
      child: Row(
        children: [
          SizedBox(
            height: 15,
            width: 15,
            child: Image.network(
              passenger.airline?.first.logo ?? "",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Text(passenger.name ?? ""),
              const SizedBox(height: 5),
              Text(passenger.trips.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
