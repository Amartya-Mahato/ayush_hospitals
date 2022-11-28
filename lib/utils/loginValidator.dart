import 'package:ayush_hospitals/connections/database.dart';
import 'package:mysql_client/mysql_client.dart';
// import 'package:mysql1/mysql1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginValidator {
  var db = Mysql(db: 'ayush_hospitals');
  Future<bool> validateEmail(
      String email, MySQLConnection conn, String pass) async {
    String query =
        "select email from ayush_hospitals.login_details where email='$email' && password='$pass'";
    IResultSet res = await conn.execute(query);
    // var res = await conn.query(query);

    bool bl = false;

    for (final row in res.rows) {
      if (row.colAt(0) == email) {
        bl = true;
        break;
      }
    }

    // bool bl = res.any((element) => element[0] == email);

    // if (bl) {
    //   return true;
    // } else {
    //   return false;
    // }

    return bl;
  }

  Future<bool> validatePass(String pass, MySQLConnection conn) async {
    String query =
        "select password from ayush_hospitals.login_details where password='$pass'";

    IResultSet res = await conn.execute(query);
    // var res = await conn.query(query);
    // bool bl = res.any((element) => element[0] == pass);
    bool bl = false;
    for (final row in res.rows) {
      if (row.colAt(0) == pass) {
        bl = true;
        break;
      }
    }

    // if (bl) {
    //   return true;
    // } else {
    //   return false;
    // }

    return bl;
  }

  Future<String> getName(
      String email, MySQLConnection conn, String pass) async {
    String query =
        "select name from ayush_hospitals.login_details where email='$email' && password='$pass'";
    // Results res = await conn.query(query);
    IResultSet res = await conn.execute(query);

    // String name = res.elementAt(0)[0];
    String name = 'unknown';

    for (final n in res.rows) {
      name = n.colAt(0)!;
    }
    return name;
  }

  Future<bool> validate(String pass, String email) async {
    if (pass == 'Password' || email == 'Email') return false;
    MySQLConnection conn = await db.getConnection();
    bool bl;
    bl = await validateEmail(email, conn, pass);
    if (!bl) return false;

    bl = await validatePass(pass, conn);
    if (!bl) return false;

    String name = await getName(email, conn, pass);
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('login', true);
      prefs.setString('name', name);
      prefs.setString('email', email);
    });
    await conn.close();
    return true;
  }
}
