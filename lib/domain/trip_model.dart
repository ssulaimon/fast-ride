class TripModel {
  final String driverName;
  final String baseLocation;
  final String destinationLocation;
  final String tripStatus;
  final double distance;
  final double amount;
  final String? id;
  final String tripId;
  const TripModel({
    required this.baseLocation,
    required this.destinationLocation,
    required this.driverName,
    required this.tripStatus,
    required this.distance,
    required this.amount,
    required this.tripId,
    this.id,
  });
  factory TripModel.fromJson(Map<String, dynamic> data) => TripModel(
      baseLocation: data["baseLocation"],
      destinationLocation: data["destinationLocation"],
      driverName: data["driverName"],
      tripStatus: data["onGoingTrip"],
      distance: data["distance"],
      amount: data["amount"],
      tripId: data["tripId"]);

  toJson() => {
        "driverName": driverName,
        "baseLocation": baseLocation,
        "destinationLocation": destinationLocation,
        "onGoingTrip": tripStatus,
        "distance": distance,
        "amount": amount,
        "tripId": tripId
      };
}
