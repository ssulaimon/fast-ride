import 'package:fastride/constant/colors.dart';
import 'package:fastride/constant/routes.dart';
import 'package:fastride/domain/driver_modal.dart';
import 'package:flutter/material.dart';

class AvailableDriverScreen extends StatelessWidget {
  const AvailableDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<DriverModel> drivers = [
      DriverModel(
          fullName: "John Doe",
          rating: 4.0,
          joinedDate: "15-02-2020",
          membershipYears: "4",
          tripNumbers: 200,
          amount: 20.00,
          vehicleName: "Tesla ModelX",
          vehicleNumber: "BH7X9H1O",
          sex: "Male",
          location: "Badagry, Lagos, state ",
          isActive: true,
          imageUrl: "https//image.png")
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: MyColors.white),
        backgroundColor: MyColors.primary,
        title: const Text(
          "Availbale Drivers",
          style: TextStyle(color: MyColors.white),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: MyColors.primary,
                radius: 30,
              ),
              title: Text(
                drivers[index].fullName,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () => Navigator.pushNamed(context, AppRoutes.driverProfile,
                  arguments: {"driverProfile": drivers[index]}),
            ),
          );
        },
        itemCount: drivers.length,
      ),
    );
  }
}
