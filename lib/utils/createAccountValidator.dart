// import 'package:mysql1/mysql1.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ayush_hospitals/connections/database.dart';

class CreateAccountValidator {
  var db = Mysql(db: 'ayush_hospitals');

  // Future<bool> vEmail(String email, var conn) async {
  //   String query =
  //       "select email from ayush_hospitals.login_details where email='$email'";
  //   var r = await conn.query(query);
  //   Results res = r;

  //   bool bl = res.any((element) => element[0]==email);
  //   if (bl) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<void> createAcc(
      String email, String pass, String name, MySQLConnection conn) async {
    String query =
        "INSERT INTO ayush_hospitals.login_details (email, password, name) VALUES(?, ?, ?)";
    // await conn.query(query, [email, pass, name]);

    var stmt = await conn.prepare(query);
    await stmt.execute([email, pass, name]);
  }

  Future<bool> validateAndCreate(String email, String pass, String name) async {
    if (pass == 'Password' || email == 'Email') return false;
    MySQLConnection conn = await db.getConnection();

    // bool bl;
    // bl = await vEmail(email, conn);
    // if (bl) return false;

    await createAcc(email, pass, name, conn);

    await conn.close();

    SharedPreferences.getInstance().then((value) {
      value.setBool('login', true);
      value.setString('name', name);
      value.setString('email', email);
    });
    return true;
  }
}
