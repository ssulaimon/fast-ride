import 'package:fastride/constant/colors.dart';
import 'package:fastride/constant/routes.dart';
import 'package:fastride/presentation/controller/home_screen_controller.dart';
import 'package:fastride/presentation/widgets/custom_btn.dart';
import 'package:fastride/presentation/widgets/ride_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: MyColors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          color: MyColors.primary,
        ),
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        bottomSheet: const BottomSheetContainer());
  }
}

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({super.key});

  String currenTime() {
    DateTime dateTime = DateTime.now();
    if (dateTime.hour < 12) {
      return "Good Morning";
    } else if (dateTime.hour < 16) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    const List<Map<String, String>> carDetails = [
      {
        "image": 'assets/images/car-image.png',
        "title": "Car",
      },
      {
        "image": 'assets/images/luxury-car.png',
        "title": "Luxury Car",
      },
      {
        "image": 'assets/images/motorcycle.png',
        "title": "Motorcycle",
      }
    ];
    String greeting = currenTime();
    return Consumer<HomeScreenController>(
      builder: (context, homeController, widget) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          height: 350,
          child: ListView(
            children: [
              Text(
                "$greeting, John Doe ",
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Select Ride',
                style: TextStyle(
                  color: MyColors.grey,
                ),
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return RideTypeWidge(
                        onTap: () {
                          homeController.rideTypeSelector(index);
                        },
                        borderColor: index == homeController.currentIndex
                            ? MyColors.primary
                            : null,
                        image: carDetails[index]["image"]!,
                        title: carDetails[index]["title"]!);
                  },
                  itemCount: carDetails.length,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Where Do You Want To Go?",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.gps_fixed,
                  color: MyColors.primary,
                ),
                title: Text("Pick Up"),
                subtitle: Text("Badagry"),
              ),
              const ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: MyColors.primary,
                ),
                title: Text("Drop-Off"),
                subtitle: Text("Iyana iba"),
              ),
              CustomButton(
                onTap: () => homeController.findDriver(),
                padding: 10,
                child: homeController.isLoading == true
                    ? const CircularProgressIndicator(
                        color: MyColors.white,
                      )
                    : const Text(
                        "Find Driver",
                        style: TextStyle(
                          color: MyColors.white,
                          fontSize: 20,
                        ),
                      ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "John Doe",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            "No.20, Badagry, Lagos state",
            style: TextStyle(
              color: MyColors.grey,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(
            height: 5,
          ),
          const ListTile(
            leading: Icon(Icons.mail_outline),
            title: Text("Messages"),
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.person_2_outlined),
            title: const Text("Profile"),
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.myProfile,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const ListTile(
            leading: Icon(Icons.car_rental_outlined),
            title: Text("Bookings"),
          ),
          const SizedBox(
            height: 5,
          ),
          const ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
