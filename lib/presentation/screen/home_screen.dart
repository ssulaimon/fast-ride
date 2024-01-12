import 'package:fastride/constant/colors.dart';
import 'package:fastride/constant/routes.dart';
import 'package:fastride/constant/validator.dart';
import 'package:fastride/domain/firebase_email_auth.dart';

import 'package:fastride/presentation/controller/home_screen_controller.dart';
import 'package:fastride/presentation/widgets/custom_btn.dart';
import 'package:fastride/presentation/widgets/ride_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
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
        body: const SizedBox(
          child: AppMap(),
        ),
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        bottomSheet: const BottomSheetContainer());
  }
}

class AppMap extends StatelessWidget {
  const AppMap({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenController>(
        builder: (context, homeScreenController, child) {
      return Stack(
        children: [
          FlutterMap(
              options: MapOptions(
                initialCenter: homeScreenController.baseLocation,
                initialZoom: 10,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(markers: [
                  Marker(
                      point: homeScreenController.baseLocation,
                      child: const Icon(
                        Icons.gps_fixed,
                        color: MyColors.primary,
                      )),
                  Marker(
                      point: homeScreenController.destinationLocation,
                      child: const Icon(
                        Icons.location_on,
                        color: MyColors.red,
                      )),
                ])
              ]),
          Positioned(
            top: 90,
            child: SizedBox(
              height: 300,
              child: RotatedBox(
                quarterTurns: 1,
                child: Slider(
                  secondaryActiveColor: MyColors.primary,
                  min: 10,
                  max: 50,
                  onChanged: (value) {},
                  value: 10,
                ),
              ),
            ),
          )
        ],
      );
    });
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

    String userName = FirebaseEmailAuth.userName;
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
                "$greeting, $userName ",
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
              ListTile(
                onTap: () => setLocation(context: context),
                leading: const Icon(
                  Icons.gps_fixed,
                  color: MyColors.primary,
                ),
                title: const Text("Pick Up"),
                subtitle: Text(homeController.baseLocationName),
              ),
              ListTile(
                onTap: () => setDestinationLocation(context: context),
                leading: const Icon(
                  Icons.location_on,
                  color: MyColors.primary,
                ),
                title: const Text("Drop-Off"),
                subtitle: Text(homeController.destinationLocationName),
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
    String userName = FirebaseEmailAuth.userName;
    String? profilePic = FirebaseEmailAuth.profilePicture;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                profilePic != null ? NetworkImage(profilePic) : null,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            userName,
            style: const TextStyle(
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
          ListTile(
            onTap: () {
              FirebaseEmailAuth.logoutUser();
              Navigator.popAndPushNamed(
                context,
                AppRoutes.loginScreen,
              );
            },
            leading: const Icon(Icons.logout_outlined),
            title: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}

void setLocation({required BuildContext context}) async {
  return await showDialog(
      context: context,
      builder: (_) {
        TextEditingController location = TextEditingController();
        GlobalKey<FormState> key = GlobalKey<FormState>();
        return Consumer<HomeScreenController>(
            builder: (context, homeScreenController, child) {
          return Material(
            color: MyColors.transparent,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(color: MyColors.white),
                height: 150,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(20),
                child: Form(
                  key: key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: location,
                        onFieldSubmitted: (text) {
                          if (key.currentState!.validate()) {
                            homeScreenController.updateBaselocation(
                                location: location.text);
                            Navigator.pop(context);
                          }
                        },
                        validator: (text) =>
                            Validator.locationValidator(text: text!),
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: MyColors.grey),
                          labelText: "Where are you heading from?",
                          hintText: "Where are you heading from?",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.primary,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      homeScreenController.lookingforLocation == true
                          ? const CircularProgressIndicator(
                              color: MyColors.primary,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      });
}

void setDestinationLocation({required BuildContext context}) async {
  return await showDialog(
      context: context,
      builder: (_) {
        TextEditingController location = TextEditingController();
        GlobalKey<FormState> key = GlobalKey<FormState>();
        return Consumer<HomeScreenController>(
            builder: (context, homeScreenController, child) {
          return Material(
            color: MyColors.transparent,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(color: MyColors.white),
                height: 150,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(20),
                child: Form(
                  key: key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: location,
                        onFieldSubmitted: (text) {
                          if (key.currentState!.validate()) {
                            homeScreenController.updateDestinationLocation(
                                location: location.text);
                            Navigator.pop(context);
                          }
                        },
                        validator: (text) =>
                            Validator.locationValidator(text: text!),
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: MyColors.grey),
                          labelText: "Where are you heading from?",
                          hintText: "Where are you heading from?",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.primary,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      homeScreenController.lookingforLocation == true
                          ? const CircularProgressIndicator(
                              color: MyColors.primary,
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      });
}
