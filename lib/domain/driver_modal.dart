class DriverModel {
  final String fullName;
  final double rating;
  final String joinedDate;
  final String membershipYears;
  final int tripNumbers;
  final double amount;
  final String vehicleName;
  final String vehicleNumber;
  final String sex;
  final String location;
  final bool isActive;
  final String imageUrl;
  const DriverModel({
    required this.fullName,
    required this.rating,
    required this.joinedDate,
    required this.membershipYears,
    required this.tripNumbers,
    required this.amount,
    required this.vehicleName,
    required this.vehicleNumber,
    required this.sex,
    required this.location,
    required this.isActive,
    required this.imageUrl,
  });

  factory DriverModel.fromJson(Map<String, dynamic> data) => DriverModel(
      fullName: data["fullName"],
      rating: data["rating"],
      joinedDate: data["joinedDate"],
      membershipYears: data["membershipYears"],
      tripNumbers: data["tripNumbers"],
      amount: data["amount"],
      vehicleName: data["vehicleName"],
      vehicleNumber: data["vehicleNumber"],
      sex: data["sex"],
      location: data["location"],
      isActive: data["isActive"],
      imageUrl: data["imageUrl"]);

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "rating": rating,
        "joinedDate": joinedDate,
        "membershipYears": membershipYears,
        "tripNumbers": tripNumbers,
        "amount": amount,
        "vehicleName": vehicleName,
        "vehicleNumber": vehicleNumber,
        "sex": sex,
        "location": location,
        "isActive": isActive,
        "imageUrl": imageUrl
      };
}
