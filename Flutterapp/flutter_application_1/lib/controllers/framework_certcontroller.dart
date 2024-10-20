// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/certificates_model.dart';
// import '../database/db_helper.dart';

// class FrameworkCertController extends GetxController {
//   var certificates = <CertificateModel>[].obs;
//   final DBHelper dbHelper = DBHelper();
//   Future<void> fetchCertificates() async {
//     try {
//       final response = await http.get(
//         Uri.parse('http://10.0.2.2:3000/api/v1/frameworks/getCertificates'),
//         headers: {
//           'Authorization':
//               'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjExMiwiZW1haWwiOiJzYXR5YW1yaWd0ZWFtQGdtYWlsLmNvbSIsImlhdCI6MTcyNjk0NzE3NX0.hW1XjBwuH8wGJLxBltB3Qi4tFBX_Jux6Y2ahoKKD5f4',
//         },
//       );

//       print('Response Status Code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final List<dynamic> jsonList = json.decode(response.body);
//         certificates.value =
//             jsonList.map((json) => CertificateModel.fromJson(json)).toList();

//         for (var cert in certificates) {
//           await dbHelper.insertCertificate(cert);
//         }
//         //printCertificates(); // Call to print the certificates

//         // Print each certificate after loading
//       } else {
//         throw Exception('Failed to load certificates: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Failed to load certificates');
//     }
//   } // Method to print the list of certificates
//   void printCertificates() {
//     if (certificates.isEmpty) {
//       print('No certificates found.');
//     } else {
//       for (var cert in certificates) {
//         print('''
// Certificate Unique ID: ${cert.certUniqueId ?? 'N/A'}
// Certificate Group: ${cert.certGroup}
// Certificate Type: ${cert.certType}
// Sort: ${cert.sort}
// Competence: ${cert.competence}
// Title: ${cert.title}
// Certificate Status: ${cert.certStatus}
// Valid Day Tick: ${cert.validDayTick}
// Not Use Valid Day: ${cert.notuseValidDay}
// Not Use Valid Hour: ${cert.notuseValidHour}
// Valid Hour Tick: ${cert.validHourTick}
// Is COS: ${cert.isCos}
// Is Major COS: ${cert.isMajorCos}
// Is Intermediate COS: ${cert.isIntermediateCos}
// Certificate Format: ${cert.certificateFormat}
// Comments: ${cert.comments}
// Parent ID: ${cert.parentId}
// Created By: ${cert.createdBy}
// Created On: ${cert.createdOn}
// Updated By: ${cert.updatedBy}
// Updated On: ${cert.updatedOn}
// Published: ${cert.published}
// Sync Date: ${cert.syncDate}
// ''');
//       }
//     }
// // }
// void printCertificates() {
//   if (certificates.isEmpty) {
//     print('No certificates found.');
//   } else {
//     // Limit to the first 5 certificates
// print("Length #############################: ${certificates.length}");
//     for (var i = 0; i < certificates.length ; i++) {
//       var cert = certificates[i];
//       print('''
// Certificate ID: ${cert.id} // Now included

// Certificate Unique ID: ${cert.certUniqueId ?? 'N/A'}
// Certificate Group: ${cert.certGroup}
// Certificate Type: ${cert.certType}
// Sort: ${cert.sort}
// Competence: ${cert.competence}
// Title: ${cert.title}
// Certificate Status: ${cert.certStatus}
// Valid Day Tick: ${cert.validDayTick}
// Not Use Valid Day: ${cert.notuseValidDay}
// Not Use Valid Hour: ${cert.notuseValidHour}
// Valid Hour Tick: ${cert.validHourTick}
// Is COS: ${cert.isCos}
// Is Major COS: ${cert.isMajorCos}
// Is Intermediate COS: ${cert.isIntermediateCos}
// Certificate Format: ${cert.certificateFormat}
// Comments: ${cert.comments}
// Parent ID: ${cert.parentId}
// Created By: ${cert.createdBy}
// Created On: ${cert.createdOn}
// Updated By: ${cert.updatedBy}
// Updated On: ${cert.updatedOn}
// Published: ${cert.published}
// Sync Date: ${cert.syncDate}
// ''');

// print("******************************************************************************");
// print("            ");
// print("            ");

//     }
// //}

//   void printCertificates() {
//     if (certificates.isEmpty) {
//       print('No certificates found.');
//     } else {
//       // Limit to the first 5 certificates
//       print("Length #############################: ${certificates.length}");

//       // Use Future.delayed to introduce a 5-second delay
//       Future.delayed(const Duration(seconds: 5), () {
//         for (var i = 0; i < certificates.length; i++) {
//           // Only display the first 5 certificates
//           var cert = certificates[i];
//           print('''
// Certificate ID: ${cert.id} // Now included

// Certificate Unique ID: ${cert.certUniqueId ?? 'N/A'}
// Certificate Group: ${cert.certGroup}
// Certificate Type: ${cert.certType}
// Sort: ${cert.sort}
// Competence: ${cert.competence}
// Title: ${cert.title}
// Certificate Status: ${cert.certStatus}
// Valid Day Tick: ${cert.validDayTick}
// Not Use Valid Day: ${cert.notuseValidDay}
// Not Use Valid Hour: ${cert.notuseValidHour}
// Valid Hour Tick: ${cert.validHourTick}
// Is COS: ${cert.isCos}
// Is Major COS: ${cert.isMajorCos}
// Is Intermediate COS: ${cert.isIntermediateCos}
// Certificate Format: ${cert.certificateFormat}
// Comments: ${cert.comments}
// Parent ID: ${cert.parentId}
// Created By: ${cert.createdBy}
// Created On: ${cert.createdOn}
// Updated By: ${cert.updatedBy}
// Updated On: ${cert.updatedOn}
// Published: ${cert.published}
// Sync Date: ${cert.syncDate}
// ''');

//           print("**************************");
//           print("            ");
//           print("            ");
//         }
//       });
//     }
//   }
// }
import 'package:get/get.dart';
import '../models/frameworkcert_model.dart';
import '../database/db_helper.dart';
import '../services/apiservices.dart';

class FrameworkCertController extends GetxController {
  var certificates = <FrameworkCertModel>[].obs;
  final DBHelper dbHelper = DBHelper();
  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  Future<void> fetchCertificates() async {
    try {
      // Call the fetchCertificates method from ApiService
      final List<dynamic>? fetchedCertificates =
          await apiService.fetchCertificates();

      if (fetchedCertificates != null) {
        certificates.value = fetchedCertificates
            .map((json) => FrameworkCertModel.fromJson(json))
            .toList();

        // Insert fetched certificates into the database
        for (var cert in certificates) {
          await dbHelper.insertCertificate(cert);
        }

        // Optionally print certificates
        printCertificates();
      } else {
        throw Exception('No certificates fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load certificates');
    }
  }

  void printCertificates() {
    if (certificates.isEmpty) {
      print('No certificates found.');
    } else {
      print("Length #############################: ${certificates.length}");
      for (var cert in certificates) {
        print('''
Certificate ID: ${cert.id} // Now included
Certificate Unique ID: ${cert.certUniqueId ?? 'N/A'}
Certificate Group: ${cert.certGroup}
Certificate Type: ${cert.certType}
Sort: ${cert.sort}
Competence: ${cert.competence}
Title: ${cert.title}
Certificate Status: ${cert.certStatus}
Valid Day Tick: ${cert.validDayTick}
Not Use Valid Day: ${cert.notuseValidDay}
Not Use Valid Hour: ${cert.notuseValidHour}
Valid Hour Tick: ${cert.validHourTick}
Is COS: ${cert.isCos}
Is Major COS: ${cert.isMajorCos}
Is Intermediate COS: ${cert.isIntermediateCos}
Certificate Format: ${cert.certificateFormat}
Comments: ${cert.comments}
Parent ID: ${cert.parentId}
Created By: ${cert.createdBy}
Created On: ${cert.createdOn}
Updated By: ${cert.updatedBy}
Updated On: ${cert.updatedOn}
Published: ${cert.published}
Sync Date: ${cert.syncDate}
''');
        print("**************************");
      }
    }
  }
}
