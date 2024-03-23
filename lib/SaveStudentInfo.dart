import 'package:flutter/material.dart';
import 'package:zaw_lin_htike_ap_assignment/ViewStudentRecord.dart';
import 'package:zaw_lin_htike_ap_assignment/home_screen.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

class SaveInfo extends StatefulWidget {
  const SaveInfo({super.key});

  @override
  _saveInfoPageState createState() => _saveInfoPageState();
}

class _saveInfoPageState extends State<SaveInfo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _UserNameController = TextEditingController();
  final TextEditingController _StuIdController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _programOfStudyController = TextEditingController();
  final TextEditingController _enrollYearController = TextEditingController();
  int indexCounter = 1;

  void signOutUser() {
    Navigator.push(
        context, MaterialPageRoute(
        builder: (context) => const Landing()
    )
    );
  }

    Future createStudentdb() async  {
     await addStuDetails(_UserNameController.text.trim(),
        _StuIdController.text.trim(),
        _phoneNumController.text.trim(),
         _emailController.text.trim(),
        _addressController.text.trim(),
       _dobController.text.trim(),
        _programOfStudyController.text.trim(),
        _enrollYearController.text.trim(),
    );
  }

  Future addStuDetails(String studentName,String studentID,String phone,
      String studentEmail,String address,String dateOfBirth,
      String ProgramOfStudy,String Enrolmentyear,
      ) async {
    await FirebaseFirestore.instance.collection(
        'users').add({
      'studentName': studentName,
      'studentID': studentID,
      'phone': phone,
      'studentEmail': studentEmail,
      'address': address,
      'dateOfBirth': dateOfBirth,
      'programOfStudy': ProgramOfStudy,
      'yearOfEnrloment': Enrolmentyear,
    });
  }

  @override
  void dispose() {
    _UserNameController.dispose();
    _StuIdController.dispose();
    _phoneNumController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    _programOfStudyController.dispose();
    _enrollYearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Save student records",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Save student Info',
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
                            margin: const EdgeInsets.only(top: 50.0),
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
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
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
                            MaterialPageRoute(builder: (context) => const SaveInfo()),
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
                            MaterialPageRoute(builder: (context) =>  ViewRecords()),
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
                            fixedSize: const Size(250,45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.amber[200],
                        ),
                        onPressed: signOutUser,
                        child: const Text(
                          'Log Out',
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15.0
                          ),
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
              padding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0.0, 20, 0.0, 15),
                      child: const Text(
                        'Save your student information',
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Name",
                          style: TextStyle(
                            fontFamily: "Inter",
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _UserNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.black)),
                              hintText: 'Student Name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "You have not entered student name";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 11.5),
                        const Text("Student ID",
                          style: TextStyle(
                            fontFamily: "Inter",
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _StuIdController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: Colors.black)),
                              hintText: 'Student ID'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "You have not entered student ID information";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 11.5),
                        const Text("Phone Number",
                          style: TextStyle(
                            fontFamily: "Inter",
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _phoneNumController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.black)),
                              hintText: '+959'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "You have not entered student phone number";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 11.5),
                        const Text("Email",
                          style: TextStyle(
                            fontFamily: "Inter",
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.black)),
                              hintText: 'Student Email'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "You have not entered student email information";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 11.5),

                        const Text("Address",
                          style: TextStyle(
                            fontFamily: "Inter",
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _addressController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.black)),
                              hintText: 'Student Address'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "You have not entered student address information";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 11.5),
                        const Text("Date of Birth",
                          style: TextStyle(
                            fontFamily: "Inter",
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _dobController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.black)),
                              hintText: 'Student Date of Birth'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "You have not entered student Date of Birth information";
                            }
                          },
                        ),
                        const SizedBox(height: 11.5),
                        const Text("Program of Study",
                          style: TextStyle(
                            fontFamily: "Inter",
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _programOfStudyController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.black)),
                              hintText: 'Student Program of Study'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "You have not entered student Program of Study";
                            }
                          },
                        ),
                        const SizedBox(height: 11.5),
                        const Text("Year of Enrolment",
                          style: TextStyle(
                            fontFamily: "Inter",
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _enrollYearController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: Colors.black),
                              ),
                              hintText: 'Year of Enrolment of the student'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "You have not entered Year of Enrolment of the student";
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 18.0),
                    SizedBox(
                      width: 350,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.all(20.0),
                          backgroundColor: Colors.amber[200],
                        ),
                        child: const Text(
                          'Save Information',
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                             createStudentdb();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewRecords()),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 6.0,),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 15.0,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

