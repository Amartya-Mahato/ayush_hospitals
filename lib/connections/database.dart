import 'package:mysql1/mysql1.dart';

class Mysql {
  String host = '34.93.99.9',
      user = 'root',
      password = 'Amartya1682',
      db;
  int port = 3306;
  Mysql({required this.db});

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}
