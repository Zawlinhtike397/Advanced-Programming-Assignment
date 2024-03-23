import 'package:flutter/material.dart';
import 'package:zaw_lin_htike_ap_assignment/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landing(),
    );
  }
}

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Get Started!",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Landing Page"),
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 150.0),
                  const Image(
                    image: AssetImage("images/GUSTO.png"),
                    width: 300.0,
                  ),
                  const SizedBox(height: 15.0),
                  const Text(
                    'Stay Organized',
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                    ),
                  ),
                  const Text(
                    'Achieve More',
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                    ),
                  ),
                  const Text(
                    'Connect with Our',
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                    ),
                  ),
                  const Text(
                    'Student Record System',
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 15.0),
                    child: SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        // onHover: true,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.all(20.0),
                          backgroundColor: Colors.amber[200],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
