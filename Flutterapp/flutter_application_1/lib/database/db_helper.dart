// import 'dart:developer';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// import '../models/certificates_model.dart';

// class DBHelper {
//   static Database? _database;

//   // Initialize the database
//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     // If the database doesn't exist, initialize it
//     _database = await _initDB();
//     return _database!;
//   }

//   Future<Database> _initDB() async {
//     String path = join(await getDatabasesPath(), 'user_database.db');

//     return await openDatabase(
//       path,
//       version: 2,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE users_account_one (
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             username TEXT,
//             password TEXT
//           )
//         ''');

//         await db.execute('''
//           CREATE TABLE users_account_two (
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             username TEXT,
//             password TEXT
//           )
//         ''');

//         await db.execute('''
//           CREATE TABLE users_account_three (
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             username TEXT,
//             password TEXT
//           )
//         ''');

//         await db.execute(
//           'CREATE TABLE framework_certificate ('
//           'id INTEGER PRIMARY KEY AUTOINCREMENT, '
//           'cert_unique_id TEXT NOT NULL, '
//           'cert_group TEXT NOT NULL, '
//           'cert_type INTEGER NOT NULL, '
//           'sort TEXT NOT NULL, '
//           'competence INTEGER NOT NULL DEFAULT 0, '
//           'title TEXT NOT NULL, '
//           'cert_status INTEGER NOT NULL, '
//           'valid_day_tick INTEGER NOT NULL, '
//           'notuse_valid_day INTEGER NOT NULL DEFAULT 0, '
//           'notuse_valid_hour INTEGER NOT NULL, '
//           'valid_hour_tick INTEGER NOT NULL, '
//           'is_cos INTEGER NOT NULL DEFAULT 0, '
//           'is_major_cos INTEGER NOT NULL DEFAULT 0, '
//           'is_intermediate_cos INTEGER NOT NULL DEFAULT 0, '
//           'certificate_format TEXT NOT NULL, '
//           'comments TEXT NOT NULL, '
//           'parent_id INTEGER NOT NULL, '
//           'created_by INTEGER NOT NULL, '
//           'created_on TEXT NOT NULL, '
//           'updated_by INTEGER NOT NULL, '
//           'updated_on TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, '
//           'published INTEGER NOT NULL, '
//           'sync_date TEXT NOT NULL'
//           ')',
//         );
//       },
//     );
//   }

//     Future<void> insertCertificate(CertificateModel certificate) async {
//     final db = await database;
//     try {
//       await db.insert(
//         'framework_certificate',
//         certificate.toJson(),
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
// //log('Inserted Certificate: ${certificate.toJson()}');
//     } catch (e) {
//   //    log('Error inserting certificate: $e');
//     }
//   }

//   Future<List<CertificateModel>> getCertificates() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('framework_certificate');
//     return List.generate(maps.length, (i) {
//       return CertificateModel.fromJson(maps[i]);
//     });
//   }

//   // Insert a user into the specified account table
//   Future<void> insertUser(
//       String username, String password, String accountSlug) async {
//     final db = await database;

//     if (accountSlug == 'account-one') {
//       log('Inserting user into account one');
//       await db.insert(
//         'users_account_one',
//         {
//           'username': username,
//           'password': password,
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     } else if (accountSlug == 'account-two') {
//       log('Inserting user into account two');
//       await db.insert(
//         'users_account_two',
//         {
//           'username': username,
//           'password': password,
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     } else if (accountSlug == 'account-three') {
//       log('Inserting user into account three');
//       await db.insert(
//         'users_account_three',
//         {
//           'username': username,
//           'password': password,
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     } else {
//       throw Exception("Invalid account slug");
//     }
//   }

//   // Retrieve user credentials from the specified account table
//   Future<Map<String, dynamic>?> getUserCredentials(String accountSlug) async {
//     final db = await database;
//     String tableName;

//     // Log users from all accounts for debugging
//     logAllUsers();

//     if (accountSlug == 'account-one') {
//       tableName = 'users_account_one';
//     } else if (accountSlug == 'account-two') {
//       tableName = 'users_account_two';
//     } else if (accountSlug == 'account-three') {
//       tableName = 'users_account_three';
//     } else {
//       throw Exception("Invalid account slug");
//     }
//   }

// // Retrieve all user credentials from the specified account table
//   Future<List<Map<String, dynamic>>> getalldata(String accountSlug) async {
//     final db = await database;
//     String tableName;

//     // Log users from all accounts for debugging
//     await logAllUsers();

//     if (accountSlug == 'account-one') {
//       tableName = 'users_account_one';
//     } else if (accountSlug == 'account-two') {
//       tableName = 'users_account_two';
//     } else if (accountSlug == 'account-three') {
//       tableName = 'users_account_three';
//     } else {
//       throw Exception("Invalid account slug");
//     }

//     // Fetch all users from the selected table
//     List<Map<String, dynamic>> result = await db.query(tableName);
//     return result; // Return all user data instead of just one
//   }

//   Future<void> logAllUsers() async {
//     final db = await database;

//     // Log users from account one
//     List<Map<String, dynamic>> usersAccountOne =
//         await db.query('users_account_one');
//     log('Users in account one: $usersAccountOne');

//     // Log users from account two
//     List<Map<String, dynamic>> usersAccountTwo =
//         await db.query('users_account_two');
//     log('Users in account two: $usersAccountTwo');

//     // Log users from account three
//     List<Map<String, dynamic>> usersAccountThree =
//         await db.query('users_account_three');
//     log('Users in account three: $usersAccountThree');
//   }
// }
import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/frameworkcert_model.dart';

class DBHelper {
  static Database? _database;

  // Initialize the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'user_database.db');

    return await openDatabase(
      path,
      version: 1, // Incremented version
      onCreate: (db, version) async {
        await _createUserTables(db);
        await _createCertificateTable(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Handle database upgrade logic if needed
        log('Database upgraded from version $oldVersion to $newVersion');
      },
    );
  }

  Future<void> _createUserTables(Database db) async {
    try {
      await db.execute('''
        CREATE TABLE users_account_one (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          password TEXT
        )
      ''');

      await db.execute('''
        CREATE TABLE users_account_two (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          password TEXT
        )
      ''');

      await db.execute('''
        CREATE TABLE users_account_three (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          password TEXT
        )
      ''');
      log('User account tables created successfully');
    } catch (e) {
      log('Error creating user account tables: $e');
    }
  }

  Future<void> _createCertificateTable(Database db) async {
    try {
      await db.execute(
        'CREATE TABLE framework_certificate ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'cert_unique_id TEXT NOT NULL, '
        'cert_group TEXT NOT NULL, '
        'cert_type INTEGER NOT NULL, '
        'sort TEXT NOT NULL, '
        'competence INTEGER NOT NULL DEFAULT 0, '
        'title TEXT NOT NULL, '
        'cert_status INTEGER NOT NULL, '
        'valid_day_tick INTEGER NOT NULL, '
        'notuse_valid_day INTEGER NOT NULL DEFAULT 0, '
        'notuse_valid_hour INTEGER NOT NULL, '
        'valid_hour_tick INTEGER NOT NULL, '
        'is_cos INTEGER NOT NULL DEFAULT 0, '
        'is_major_cos INTEGER NOT NULL DEFAULT 0, '
        'is_intermediate_cos INTEGER NOT NULL DEFAULT 0, '
        'certificate_format TEXT NOT NULL, '
        'comments TEXT NOT NULL, '
        'parent_id INTEGER NOT NULL, '
        'created_by INTEGER NOT NULL, '
        'created_on TEXT NOT NULL, '
        'updated_by INTEGER NOT NULL, '
        'updated_on TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, '
        'published INTEGER NOT NULL, '
        'sync_date TEXT NOT NULL'
        ')',
      );
      log('framework_certificate table created successfully');
    } catch (e) {
      log('Error creating framework_certificate table: $e');
    }
  }

  // Insert a certificate into the framework_certificate table
  Future<void> insertCertificate(FrameworkCertModel certificate) async {
    final db = await database;
    try {
      await db.insert(
        'framework_certificate',
        certificate.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      log('Inserted Certificate: ${certificate.toJson()}');
    } catch (e) {
      log('Error inserting certificate: $e');
    }
  }

  // Retrieve all certificates from the framework_certificate table
  Future<List<FrameworkCertModel>> getCertificates() async {
    final db = await database;
    try {
      final List<Map<String, dynamic>> maps =
          await db.query('framework_certificate');
      return List.generate(maps.length, (i) {
        return FrameworkCertModel.fromJson(maps[i]);
      });
    } catch (e) {
      log('Error retrieving certificates: $e');
      return []; // Return an empty list on error
    }
  }

  // Insert a user into the specified account table
  Future<void> insertUser(
      String username, String password, String accountSlug) async {
    final db = await database;

    try {
      String tableName = _getUserTableName(accountSlug);
      log('Inserting user into $tableName');
      await db.insert(
        tableName,
        {'username': username, 'password': password},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      log('Error inserting user into $accountSlug: $e');
    }
  }

  // Retrieve user credentials from the specified account table
  Future<Map<String, dynamic>?> getUserCredentials(String accountSlug) async {
    final db = await database;
    String tableName = _getUserTableName(accountSlug);
    await logAllUsers();

    try {
      List<Map<String, dynamic>> result = await db.query(tableName);
      return result.isNotEmpty
          ? result.first
          : null; // Return the first user or null if no users
    } catch (e) {
      log('Error retrieving user credentials from $accountSlug: $e');
      return null;
    }
  }

  // Retrieve all user credentials from the specified account table
  Future<List<Map<String, dynamic>>> getAllData(String accountSlug) async {
    final db = await database;
    String tableName = _getUserTableName(accountSlug);
    await logAllUsers();

    try {
      List<Map<String, dynamic>> result = await db.query(tableName);
      return result; // Return all user data instead of just one
    } catch (e) {
      log('Error retrieving all data from $accountSlug: $e');
      return []; // Return an empty list on error
    }
  }

  // Retrieve the table name based on account slug
  String _getUserTableName(String accountSlug) {
    if (accountSlug == 'account-one') {
      return 'users_account_one';
    } else if (accountSlug == 'account-two') {
      return 'users_account_two';
    } else if (accountSlug == 'account-three') {
      return 'users_account_three';
    } else {
      throw Exception("Invalid account slug");
    }
  }

  // Log users from all account tables for debugging
  Future<void> logAllUsers() async {
    final db = await database;

    try {
      List<Map<String, dynamic>> usersAccountOne =
          await db.query('users_account_one');
      log('Users in account one: $usersAccountOne');

      List<Map<String, dynamic>> usersAccountTwo =
          await db.query('users_account_two');
      log('Users in account two: $usersAccountTwo');

      List<Map<String, dynamic>> usersAccountThree =
          await db.query('users_account_three');
      log('Users in account three: $usersAccountThree');
    } catch (e) {
      log('Error logging users: $e');
    }
  }
}
