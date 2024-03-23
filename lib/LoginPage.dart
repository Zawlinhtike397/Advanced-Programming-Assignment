import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zaw_lin_htike_ap_assignment/auth_page.dart';
import 'package:zaw_lin_htike_ap_assignment/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _storeUserData();
  }

  void SignInUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _EmailController.text,
          password: _passwordController.text
      );
      if(mounted){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AuthPage()),
        );
      }
     } on FirebaseAuthException catch (e) {
      if (_EmailController.text.isEmpty && _passwordController.text.isEmpty) {
        alertEmptyInfo();
      }
      else if (_EmailController.text.isEmpty) {
        alertEmptyEmail();
      }
      else if (_passwordController.text.isEmpty) {
        alertEmptyPassword();
      }
      else if (e.code == 'user-not-found') {
        alertUserNotMatch();
      }
      else if (e.code == 'invalid-email') {
        alertWrongEmail();
      }
      else if (e.code == 'wrong-password') {
        alertWrongPassword();
      }
    }
  }

  void alertEmptyInfo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'You have not entered your email and password information',
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

  void alertEmptyEmail() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'You have not entered your email information',
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

  void alertEmptyPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'You have not entered your password information',
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

  void alertUserNotMatch() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'User does not exist',
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

  void alertWrongEmail() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'wrong email format',
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

  void alertWrongPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'wrong password',
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

  void _storeUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedEmailLogin = prefs.getString("EmailLogin") ?? "";
    String storedPasswordLogin = prefs.getString("PasswordLogin") ?? "";

    setState(() {
      _EmailController.text = storedEmailLogin;
      _passwordController.text = storedPasswordLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Login to Our App",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login to Our App',
            style: TextStyle(
              fontFamily: "Inter",
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
                      'GUSTO University',
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 23.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Image(
                      image: AssetImage("images/GUSTO.png"),
                      width: 300.0,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      'Login to your account',
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email"),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _EmailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.black)),
                              hintText: 'Email'),
                        ),
                        const SizedBox(height: 13.0),
                        const Text("Password"),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(
                                      width: 3,
                                      color: Colors.black)),
                              hintText: 'Password'),
                          obscureText: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
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
                        onPressed: () async {
                            SignInUser();
                            String email = _EmailController.text;
                            String password = _passwordController.text;
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString("EmailLogin", email);
                            prefs.setString("PasswordLogin", password);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 13.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "New user?",
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
                                  builder: (context) => const Register()),
                            );
                          },
                          child:  const Text(
                            "Register your account",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 17.0,
                                color: Colors.teal
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
