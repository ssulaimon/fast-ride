import 'package:fastride/constant/colors.dart';
import 'package:fastride/constant/routes.dart';
import 'package:fastride/domain/driver_modal.dart';
import 'package:fastride/domain/drivers_loader.dart';
import 'package:flutter/material.dart';

class AvailableDriverScreen extends StatelessWidget {
  const AvailableDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: MyColors.white),
          backgroundColor: MyColors.primary,
          title: const Text(
            "Availbale Drivers",
            style: TextStyle(color: MyColors.white),
          ),
        ),
        body: FutureBuilder(
            future: DriverLoaders.loadDrivers(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text("Loadding Drivers"),
                );
              } else if (snapShot.hasError) {
                return const Center(
                  child: Text("Something Went Wrong"),
                );
              } else {
                List<DriverModel> drivers = snapShot.data as List<DriverModel>;
                return ListView.builder(
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
                        onTap: () => Navigator.pushNamed(
                            context, AppRoutes.driverProfile,
                            arguments: {"driverProfile": drivers[index]}),
                      ),
                    );
                  },
                  itemCount: drivers.length,
                );
              }
            }));
  }
}
