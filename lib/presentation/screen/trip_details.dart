// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastride/constant/colors.dart';
import 'package:fastride/constant/ride_status.dart';
import 'package:fastride/domain/firebase_email_auth.dart';
import 'package:fastride/domain/trip_model.dart';
import 'package:fastride/presentation/controller/rating_controller.dart';
import 'package:fastride/presentation/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> trip =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    TripModel tripModel = trip["trip"];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trip Details "),
      ),
      body: ListView(
        children: [
          const Center(
            child: CircleAvatar(
              radius: 50,
            ),
          ),
          ListTile(
            leading: const Text(
              "Driver Name",
              style: TextStyle(color: MyColors.grey),
            ),
            title: Text(tripModel.driverName),
          ),
          ListTile(
            leading: const Text(
              "Trip ID",
              style: TextStyle(color: MyColors.grey),
            ),
            title: Text(
              tripModel.tripId,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          ListTile(
            leading: const Text(
              "Amount Paid",
              style: TextStyle(color: MyColors.grey),
            ),
            title: Text(
              "\$${tripModel.amount.toString()}",
            ),
          ),
          ListTile(
            leading: const Text(
              "Base Location",
              style: TextStyle(color: MyColors.grey),
            ),
            title: Text(tripModel.baseLocation),
          ),
          ListTile(
            leading: const Text(
              "Destination Location",
              style: TextStyle(color: MyColors.grey),
            ),
            title: Text(tripModel.destinationLocation),
          ),
          ListTile(
            leading: const Text(
              "Trip Status",
              style: TextStyle(color: MyColors.grey),
            ),
            title: Text(tripModel.tripStatus),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomButton(
              onTap: () {
                ratingDialogue(
                  context: context,
                  id: tripModel.id!,
                );
              },
              padding: 15,
              child: const Text(
                "Trip Completed",
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomButton(
              padding: 15,
              onTap: () {},
              child: const Text(
                "Cancel Trip",
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void ratingDialogue({required BuildContext context, required String id}) async {
  await showDialog(
      context: context,
      builder: (context) {
        return Consumer<RatingController>(
            builder: (context, ratingController, child) {
          return Material(
            color: MyColors.transparent,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(color: MyColors.white),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Rate Your Trip",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => ratingController.ratingNumber = 1,
                          icon: Icon(
                            Icons.star,
                            size: 30,
                            color: ratingController.ratingNumber > 0
                                ? MyColors.primary
                                : MyColors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () => ratingController.ratingNumber = 2,
                          icon: Icon(
                            Icons.star,
                            size: 30,
                            color: ratingController.ratingNumber > 1
                                ? MyColors.primary
                                : MyColors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () => ratingController.ratingNumber = 3,
                          icon: Icon(
                            Icons.star,
                            size: 30,
                            color: ratingController.ratingNumber > 2
                                ? MyColors.primary
                                : MyColors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () => ratingController.ratingNumber = 4,
                          icon: Icon(
                            Icons.star,
                            size: 30,
                            color: ratingController.ratingNumber > 3
                                ? MyColors.primary
                                : MyColors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    CustomButton(
                      padding: 18,
                      child: const Text(
                        "Done",
                        style: TextStyle(color: MyColors.white, fontSize: 15),
                      ),
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection(FirebaseEmailAuth.userId)
                            .doc(id)
                            .update({"onGoingTrip": RideStatus.completed.name});
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
      });
}
