import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastride/constant/colors.dart';
import 'package:fastride/constant/routes.dart';
import 'package:fastride/domain/firebase_email_auth.dart';
import 'package:fastride/domain/trip_model.dart';
import 'package:flutter/material.dart';

import '../../constant/ride_status.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.transparent,
            title: const Text("Bookings"),
            bottom: const TabBar(
                indicatorColor: MyColors.primary,
                labelColor: MyColors.primary,
                tabs: [
                  Tab(
                    text: "Active",
                  ),
                  Tab(
                    text: "Completed",
                  ),
                  Tab(
                    text: "Cancelled",
                  )
                ]),
          ),
          body: const TabBarView(
              children: [PendingTrips(), CompletedTrips(), CancelledTrips()])),
    );
  }
}

class PendingTrips extends StatelessWidget {
  const PendingTrips({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    String userId = FirebaseEmailAuth.userId;
    final data = firebaseFirestore
        .collection(userId)
        .where("onGoingTrip", isEqualTo: RideStatus.ongoing.name)
        .get();
    return FutureBuilder(
      future: data,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text("Getting data .."),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something Went Wrong..."),
          );
        } else {
          List data = snapshot.data!.docs;

          return ListView.builder(
            itemBuilder: (context, index) {
              TripModel tripModel = TripModel(
                  baseLocation: data[index]["baseLocation"],
                  destinationLocation: data[index]['destinationLocation'],
                  driverName: data[index]['driverName'],
                  tripStatus: data[index]["onGoingTrip"],
                  distance: data[index]["distance"],
                  amount: data[index]["amount"],
                  tripId: data[index]["tripId"],
                  id: data[index].id);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () => Navigator.pushNamed(
                      context, AppRoutes.tripDetails,
                      arguments: {
                        "trip": tripModel,
                      }),
                  leading: const CircleAvatar(
                    radius: 30,
                  ),
                  title: Text(tripModel.driverName),
                  trailing: Text(
                    tripModel.amount.toString(),
                  ),
                ),
              );
            },
            itemCount: data.length,
          );
        }
      }),
    );
  }
}

class CompletedTrips extends StatelessWidget {
  const CompletedTrips({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    String userId = FirebaseEmailAuth.userId;
    final data = firebaseFirestore
        .collection(userId)
        .where("onGoingTrip", isEqualTo: RideStatus.completed.name)
        .get();
    return FutureBuilder(
      future: data,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text("Getting data .."),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something Went Wrong..."),
          );
        } else {
          List data = snapshot.data!.docs;

          return ListView.builder(
            itemBuilder: (context, index) {
              TripModel tripModel = TripModel(
                  baseLocation: data[index]["baseLocation"],
                  destinationLocation: data[index]['destinationLocation'],
                  driverName: data[index]['driverName'],
                  tripStatus: data[index]["onGoingTrip"],
                  distance: data[index]["distance"],
                  amount: data[index]["amount"],
                  tripId: data[index]["tripId"],
                  id: data[index].id);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                  ),
                  title: Text(tripModel.driverName),
                  trailing: Text(
                    tripModel.amount.toString(),
                  ),
                ),
              );
            },
            itemCount: data.length,
          );
        }
      }),
    );
  }
}

class CancelledTrips extends StatelessWidget {
  const CancelledTrips({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    String userId = FirebaseEmailAuth.userId;
    final data = firebaseFirestore
        .collection(userId)
        .where("onGoingTrip", isEqualTo: RideStatus.cancelled.name)
        .get();
    return FutureBuilder(
      future: data,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text("Getting data .."),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something Went Wrong..."),
          );
        } else {
          List data = snapshot.data!.docs;

          return ListView.builder(
            itemBuilder: (context, index) {
              TripModel tripModel = TripModel(
                  baseLocation: data[index]["baseLocation"],
                  destinationLocation: data[index]['destinationLocation'],
                  driverName: data[index]['driverName'],
                  tripStatus: data[index]["onGoingTrip"],
                  distance: data[index]["distance"],
                  amount: data[index]["amount"],
                  tripId: data[index]["tripId"],
                  id: data[index].id);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                  ),
                  title: Text(tripModel.driverName),
                  trailing: Text(
                    tripModel.amount.toString(),
                  ),
                ),
              );
            },
            itemCount: data.length,
          );
        }
      }),
    );
  }
}
