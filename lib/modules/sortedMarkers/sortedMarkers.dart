import 'package:ayush_hospitals/connections/database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SortedMarkers {
  static var db = Mysql(db: 'ayush_hospitals');

  static Future<List<List<dynamic>>> getSortedMarkers(
      String state, String district, String type) async {
    List<List<dynamic>> res = [];

    var conn = await db.getConnection();
    String query =
        "select Latitude,Longitude,Hospital_Id,Hospital_Name from ayush_hospitals.hospital_details where State='$state' && District='$district' && Hospital_Type='$type'";
    var result = await conn.query(query);

    for (var val in result) {
      res.add([
        LatLng(double.parse(val[0].toString().replaceAll(RegExp('°'), '')),
            double.parse(val[1].replaceAll(RegExp('°'), ''))),
        val[2],
        val[3]
      ]);
    }
    await conn.close();
    return res;
  }
}
