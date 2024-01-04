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
  });

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
        "location": location
      };
}
