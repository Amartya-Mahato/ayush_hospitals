// import 'package:mysql1/mysql1.dart';
import 'package:mysql_client/mysql_client.dart';

class Mysql {
  String host = 'ayushman-hospital.mysql.database.azure.com',
      //  '34.93.99.9',
      user = 'Amartya135@ayushman-hospital',
      // 'root',
      password = 'Amartya1682',
      db;
  int port = 3306;
  Mysql({required this.db});

  Future<MySQLConnection> getConnection() async {
    // var settings = ConnectionSettings(
    //     host: host, port: port, user: user, password: password, db: db);
    // MySqlConnection connection = await MySqlConnection.connect(settings);

    // return connection;

    final conn = await MySQLConnection.createConnection(
      host: "ayushman-hospital.mysql.database.azure.com",
      port: 3306,
      userName: "Amartya135@ayushman-hospital",
      password: "Amartya1682",
      databaseName: db, // optional
    );
// actually connect to database
    await conn.connect();

    return conn;
  }
}
