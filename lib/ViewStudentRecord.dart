import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zaw_lin_htike_ap_assignment/UpdateStudentRecord.dart';
import 'package:zaw_lin_htike_ap_assignment/home_screen.dart';
import 'SaveStudentInfo.dart';
import 'main.dart';

class StoredAssets {
  static final Color drawerItemColor = Colors.blueGrey;
  static final Color? drawerItemSelectedColor = Colors.white;
  static final Color? drawerSelectedTileColor = Colors.tealAccent[300];

  static final drawerItemText = [
    'Home',
    'Save',
    'View',
    'Update',
  ];

  static final drawerItemIcon = [
    Icons.home,
    Icons.save,
    Icons.view_agenda,
    Icons.update,
  ];
}

class ViewRecords extends StatefulWidget {
  ViewRecords({super.key});


  @override
  _viewRecordPageState createState() => _viewRecordPageState();
}

class _viewRecordPageState extends State<ViewRecords> {
  int indexCounter = 2;

  void signOutUser() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Landing()));
  }

  final studentRecordsCollection =
      FirebaseFirestore.instance.collection("users").snapshots();

  void deleteStudentRecord(String id) async {
    await FirebaseFirestore.instance.collection("users").doc(id).delete();
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Student Record was Deleted',
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 25.0,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Colors.teal,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "View student records",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Student Records',
            style: TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 280.0,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.teal.shade200,
                    ),
                    padding: EdgeInsets.zero,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50.0),
                            child: const Image(
                              image: AssetImage('images/GUSTO.png'),
                              width: 200.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text(
                            'GUSTO University',
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 25.0,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                          // SizedBox(height: 60.0),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            indexCounter = 0;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                        selected: indexCounter == 0,
                        selectedTileColor: Colors.teal.shade200,
                        leading: Icon(
                          StoredAssets.drawerItemIcon[0],
                          size: 37,
                          color: indexCounter == 0
                              ? StoredAssets.drawerItemSelectedColor
                              : StoredAssets.drawerItemColor,
                        ),
                        title: Text(
                          StoredAssets.drawerItemText[0],
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 20.0,
                            color: indexCounter == 0
                                ? StoredAssets.drawerItemSelectedColor
                                : StoredAssets.drawerItemColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            indexCounter = 1;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SaveInfo()),
                          );
                        },
                        selected: indexCounter == 1,
                        selectedTileColor: Colors.teal.shade200,
                        leading: Icon(
                          StoredAssets.drawerItemIcon[1],
                          size: 37,
                          color: indexCounter == 1
                              ? StoredAssets.drawerItemSelectedColor
                              : StoredAssets.drawerItemColor,
                        ),
                        title: Text(
                          StoredAssets.drawerItemText[1],
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 20.0,
                            color: indexCounter == 1
                                ? StoredAssets.drawerItemSelectedColor
                                : StoredAssets.drawerItemColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            indexCounter = 2;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewRecords()),
                          );
                        },
                        selected: indexCounter == 2,
                        selectedTileColor: Colors.teal.shade200,
                        leading: Icon(
                          StoredAssets.drawerItemIcon[2],
                          size: 37,
                          color: indexCounter == 2
                              ? StoredAssets.drawerItemSelectedColor
                              : StoredAssets.drawerItemColor,
                        ),
                        title: Text(
                          StoredAssets.drawerItemText[2],
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 20.0,
                            color: indexCounter == 2
                                ? StoredAssets.drawerItemSelectedColor
                                : StoredAssets.drawerItemColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.amber[200],
                        ),
                        onPressed: signOutUser,
                        child: const Text(
                          'Log Out',
                          style: TextStyle(fontFamily: "Inter", fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 20, 0.0, 15),
                    child: const Text(
                      'Student Records',
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  StreamBuilder(
                    stream: studentRecordsCollection,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<QueryDocumentSnapshot> stuRecords =
                            snapshot.data!.docs;
                        if (stuRecords.isEmpty) {
                          return Center(
                            child: Text(
                              "There is  No student Records",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          );
                        }
                        return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            itemCount: stuRecords.length,
                            itemBuilder: (context, index) {
                              final stuData = stuRecords[index].data()
                                  as Map<String, dynamic>;
                              final stuDataID = stuRecords[index].id;
                              final String stuName = stuData["studentName"];
                              final String stuID = stuData["studentID"];
                              final String stuPhoneNum = stuData["phone"];
                              final String stuEmail = stuData["studentEmail"];
                              final String stuAddress = stuData["address"];
                              final String stuDateOfBirth =
                                  stuData["dateOfBirth"];
                              final String stuProgramOfStudy =
                                  stuData["programOfStudy"];
                              final String stuEnrolmentYear =
                                  stuData["yearOfEnrloment"];
                              return Container(
                                margin: EdgeInsets.only(bottom: 16),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 4,
                                  color: Colors.teal[300],
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          "Name: $stuName"
                                          "\n\n Student ID: $stuID"
                                          "\n\n Phone No: $stuPhoneNum"
                                          "\n\n Email: $stuEmail"
                                          "\n\n Address: $stuAddress"
                                          "\n\n Date of Birth: $stuDateOfBirth"
                                          "\n\n Program of Study: $stuProgramOfStudy"
                                          "\n\n Year of Enrolment: "
                                          "$stuEnrolmentYear",
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.lime[300],
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          updateRecordPage(
                                                            sName: stuName,
                                                            sID: stuID,
                                                            phoneNum: stuPhoneNum,
                                                            sEmail: stuEmail,
                                                            sAddress: stuAddress,
                                                            sDateOfBirth: stuDateOfBirth,
                                                            sProgramOfStudy: stuProgramOfStudy,
                                                            sEnrolYear: stuEnrolmentYear,
                                                            id: stuDataID,
                                                          ),
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                'Update Record',
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: "Inter",
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.lime[300],
                                              ),
                                              onPressed: () {
                                                deleteStudentRecord(stuDataID);
                                              },
                                              child: const Text(
                                                'Delete Record',
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: "Inter",
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text("Error found"),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SaveInfo()),
            );
          },
          backgroundColor: Colors.teal,
          child: Text("create"),
        ),
      ),
    );
  }
}
