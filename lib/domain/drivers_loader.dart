import 'dart:convert';

import 'package:fastride/domain/driver_modal.dart';
import 'package:flutter/services.dart';

class DriverLoaders {
  static Future<List<DriverModel>> loadDrivers() async {
    String data =
        await rootBundle.loadString('assets/drivers-data/driver_data.json');
    Map<String, dynamic> json = await jsonDecode(data);
    List items = json['drivers'];
    List<DriverModel> drivers =
        List.generate(items.length, (index) => DriverModel(fullName: items[index]["fullName"], rating: items[index]["rating"], joinedDate: items[index]["joinedDate"], membershipYears: items[index]["membershipYears"], tripNumbers: items[index]["tripNumbers"], amount: items[index]["amount"], vehicleName: items[index]["vehicleName"], vehicleNumber: items[index]["vehicleNumber"], sex: items[index]["sex"], location: items[index]["location"], isActive:items[index] ["isActive"], imageUrl: "imageUrl",),);
        return drivers;
  }
}
