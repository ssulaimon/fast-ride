import 'package:fastride/constant/colors.dart';
import 'package:fastride/domain/driver_modal.dart';
import 'package:fastride/presentation/widgets/driver_more_details_widget.dart';
import 'package:flutter/material.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> driverProfile =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    DriverModel driverModal = driverProfile['driverProfile'] as DriverModel;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: MyColors.transparent,
        title: const Text("Driver Profile"),
      ),
      body: ListView(
        children: [
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: MyColors.primary,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              driverModal.fullName,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),
          Center(
            child: Text(
              driverModal.location,
              style: const TextStyle(color: MyColors.grey),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: MyColors.primary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {},
                icon: const Icon(
                  Icons.mail_rounded,
                  color: MyColors.primary,
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: MyColors.white),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: MyColors.primary,
                    ),
                    const Text(
                      "8km",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Expanded(child: Container()),
                    const Icon(
                      Icons.timer,
                      color: MyColors.primary,
                    ),
                    const Text(
                      "5min",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Expanded(child: Container()),
                    const Icon(
                      Icons.attach_money,
                      color: MyColors.primary,
                    ),
                    const Text(
                      "\$20",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    DriverMoreDetailsWidget(
                      icon: const Icon(Icons.star, color: MyColors.white),
                      data: driverModal.rating.toString(),
                      title: 'Rating',
                    ),
                    Expanded(child: Container()),
                    DriverMoreDetailsWidget(
                      icon: const Icon(Icons.local_taxi, color: MyColors.white),
                      data: driverModal.tripNumbers.toString(),
                      title: 'Trips',
                    ),
                    Expanded(child: Container()),
                    DriverMoreDetailsWidget(
                      icon: const Icon(Icons.timer, color: MyColors.white),
                      data: driverModal.membershipYears,
                      title: 'Years',
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text(
              "Membership Since",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Text(driverModal.joinedDate),
          ),
          ListTile(
            title: const Text(
              "Vehicle",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Text(driverModal.vehicleName),
          ),
          ListTile(
            title: const Text(
              "Vehicle Number",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Text(driverModal.vehicleNumber),
          ),
          ListTile(
            title: const Text(
              "Location",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Text(driverModal.location),
          ),
          ListTile(
            title: const Text(
              "Sex",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Text(driverModal.sex),
          ),
        ],
      ),
    );
  }
}
