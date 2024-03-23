import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zaw_lin_htike_ap_assignment/SaveStudentInfo.dart';
import 'package:zaw_lin_htike_ap_assignment/ViewStudentRecord.dart';
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

//HomePage
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  int indexCounter = 0;
  final userGmail = FirebaseAuth.instance.currentUser!;

  void signOutUser() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Landing()));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Home Page",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home Page',
            style: TextStyle(
              fontFamily: "Inter",
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 30.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.blueGrey.shade300,
                          foregroundColor: Colors.black38,
                          child: const Icon(
                            Icons.person,
                            size: 40.0,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Column(
                          children: [
                            const Text(
                              "Welcome to your account.",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              userGmail.email!,
                              style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Features",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 170.0,
                            child: Text(
                              "Embrace progress and"
                              " empower for success."
                              " Take action and Save Now.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          // const SizedBox(width: 10.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22.0, vertical: 20.0),
                              backgroundColor: Colors.amber[200],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SaveInfo()),
                              );
                            },
                            child: const Text(
                              'Save Record',
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 170.0,
                            child: Text(
                              "Click now to explore"
                              " and effortlessly navigate the"
                              " visually appealing card-based view",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          // const SizedBox(width: 10.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22.0, vertical: 20.0),
                              backgroundColor: Colors.amber[200],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  ViewRecords()),
                              );
                            },
                            child: const Text(
                              'View Record',
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ],
              ),
            ),

            // Text("Features")
          ),
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
      ),
    );
  }
}
