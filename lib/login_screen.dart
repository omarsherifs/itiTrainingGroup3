import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/home_screen.dart';
import 'package:flutter_application_2/widgets/my_custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Login page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 100,
                height: 100,
                child: Image.asset("assets/dart.png"),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (value) {
                    if (value!.isNotEmpty && value!.contains("@")) {
                      return null;
                    } else {
                      return "add valid email";
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "password"),
                  validator: (value) {
                    if (value!.length < 8) {
                      return "Add Vaild password";
                    }
                  },
                ),
              ),
              // MyCustomButton(
              //   label: "Signup",
              //   onTap: () {},
              // ),

              MyCustomButton(
                label: "Login",
                onTap: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString('email', emailController.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                              // email: emailController.text,
                              )),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error')),
                    );
                  }
                },
              ),

              // InkWell(
              //   onTap: () {
              //     // Validate returns true if the form is valid, or false otherwise.
              //     if (_formKey.currentState!.validate()) {
              //       // If the form is valid, display a snackbar. In the real world,
              //       // you'd often call a server or save the information in a database.
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(content: Text('Login Done')),
              //       );
              //     }
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Container(
              //       width: 200,
              //       height: 50,
              //       decoration: BoxDecoration(
              //         color: Colors.red,
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: Center(
              //           child: Text(
              //         "Login",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       )),
              //     ),
              //   ),
              // )

              // ElevatedButton(
              // onPressed: () {}, child: Container(height: 50, width: 200, child: Center(child: Text("login"))))
            ],
          ),
        ),
      ),
    );
  }
}

// Expanded(
//       flex: 2,
//       child: Container(
//         color: Colors.yellow,
//         width: 50,
//         height: 50,
//       ),
//     ),
//     Expanded(
//       flex: 2,
//       child: Container(
//         color: Colors.green,
//         width: 50,
//         height: 50,
//       ),
//     ),
//     Expanded(
//       flex: 2,
//       child: Container(
//         color: Colors.blue,
//         width: 50,
//         height: 50,
//       ),
//     ),

// SizedBox(
//           height: 10,
//         ),
//         Container(
//           width: 100,
//           height: 100,
//           child: Image.asset("assets/dart.png"),
//         ),
//         Padding(
//           padding: EdgeInsets.all(10),
//           child: TextFormField(
//             decoration: InputDecoration(labelText: "Email"),
//           ),
//         ),
//         CupertinoButton.filled(
//           onPressed: () {},
//           child: const Text('Enabled'),
//         ),
