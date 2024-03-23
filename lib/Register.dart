import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zaw_lin_htike_ap_assignment/LoginPage.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _UserNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  void signUpSaveData() async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Register Our App",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Register Our App',
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.teal,
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
                    const Text(
                      'Gusto University',
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'Do you want Quality Education',
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Image(
                      image: AssetImage("images/GUSTO.png"),
                      width: 400.0,
                    ),
                    const Text(
                      'Register account',
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 25.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Username"),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _UserNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.black)),
                              hintText: 'Username'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "You have not entered your username";
                            }
                            return null;
                          },
                        ),
                        const Text("Email"),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.black)),
                              hintText: 'Email'),
                            validator: (value) {
                            if (value!.isEmpty) {
                              return "You have not entered your email information";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 13.0),
                        const Text("Password"),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.black)),
                              hintText: 'Password'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "You have not entered your password information";
                              } else if (value.length < 6){
                                return "Your password is too short";
                              }
                              return null;
                            },
                        ),
                        const SizedBox(height: 13.0),
                        const Text("Confirm Password"),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          obscureText: true,
                          controller: _confirmpasswordController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.black)),
                              hintText: 'Confirm Password'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "You have not re-entered your confirmed password information";
                            } else if (value.length < 6){
                              return "Your confirmed password is too short";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
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
                          'Register',
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            signUpSaveData();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 13.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 17.0,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 17.0,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ],
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
