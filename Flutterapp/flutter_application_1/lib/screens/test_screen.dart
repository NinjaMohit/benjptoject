// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/login_screen.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import '../controllers/account_controller.dart'; // Make sure this imports your AccountController
// import '../database/db_helper.dart';

// class TestScreen extends StatefulWidget {
//   const TestScreen({super.key});

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   final accountController = Get.put(AccountController());
//   final dbHelper = DBHelper(); // Instantiate your DBHelper

//   @override
//   Widget build(BuildContext context) {
//     var widthm = MediaQuery.of(context).size.width;
//     var heightm = MediaQuery.of(context).size.height;

//     double width = widthm / 100;
//     double height = heightm / 100;

//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: height * 10,
//         centerTitle: true,
//         backgroundColor: HexColor("02609F"),
//         title: Text(
//           'Test Screen',
//           style: GoogleFonts.inter(
//             fontSize: 16,
//             color: HexColor("#FFFFFF"),
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         leading: Transform.scale(
//           scale: 1.2,
//           child: InkWell(
//             onTap: () {
//               Get.to(() => const LoginScreen());
//             },
//             child: Container(
//               alignment: Alignment.center,
//               child: Image.asset(
//                 "assets/images/backarrow.png",
//               ),
//             ),
//           ),
//         ),
//         actions: [
//           Transform.scale(
//             scale: 1.2,
//             child: Container(
//               padding: EdgeInsets.only(right: width * 4),
//               child: Image.asset(
//                 "assets/images/homeicon.png",
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: SizedBox(
//           height: height * 100,
//           child: Column(
//             children: [
//               Expanded(
//                 child: FutureBuilder<List<Map<String, dynamic>>>(
//                   future:
//                       fetchAllUserData(), // Call the function to fetch all user data
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return Center(child: Text('No user data available'));
//                     }

//                     final allUserData = snapshot.data!;

//                     return ListView.builder(
//                       itemCount: allUserData.length,
//                       itemBuilder: (context, index) {
//                         final userData = allUserData[index];

//                         return ListTile(
//                           title: Text(userData['instanceName']),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Slug: ${userData['slug']}'),
//                               Text('Username: ${userData['username']}'),
//                               Text('Password: ${userData['password']}'),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Method to fetch all user credentials from all accounts
//   Future<List<Map<String, dynamic>>> fetchAllUserData() async {
//     List<Map<String, dynamic>> allUsers = [];

//     // Iterate over each account to fetch user data
//     for (var account in accountController.accounts) {
//       final userDataList = await dbHelper
//           .getalldata(account.accountSlug); // Fetch user data from DBHelper
//       for (var userData in userDataList) {
//         allUsers.add({
//           'instanceName': account.instanceName,
//           'slug': account.accountSlug,
//           'username': userData['username'],
//           'password': userData['password'],
//         });
//       }
//     }

//     return allUsers; // Return the combined list of all users
//   }
// }
//lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/framework_certcontroller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Certificate App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CertificateView(),
    );
  }
}

class CertificateView extends StatelessWidget {
  final FrameworkCertController controller = Get.put(FrameworkCertController());

  CertificateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Certificates')),
      body: Obx(() {
        if (controller.certificates.isEmpty) {
          return Center(
            child: ElevatedButton(
              onPressed: () => controller.fetchCertificates(),
              child: const Text('Load Certificates'),
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.certificates.length,
          itemBuilder: (context, index) {
            final certificate = controller.certificates[index];
            return ListTile(
              title: Text(certificate.title),
              subtitle: Text('Group: ${certificate.certGroup}'),
            );
          },
        );
      }),
    );
  }
}
