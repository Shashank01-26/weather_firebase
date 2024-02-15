import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_assignment/login_page/login_page_model.dart';
import 'package:weather_assignment/screens/weather_screen.dart';

import '../Utils/user_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   late LoginPageModel _model;
   final scaffoldKey = GlobalKey<ScaffoldState>();
   bool _loading = false;

   @override
   void initState(){
     _model = LoginPageModel();
     _model.emailController ??= TextEditingController();
     _model.passwordController ??= TextEditingController();

     WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
   }

   @override
   void dispose(){
     _model.dispose();
     super.dispose();
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.80,
          height: MediaQuery.sizeOf(context).width * 0.90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow:[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 2, // Blur radius
                offset: Offset(0, 3), // Offset
              ),
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0,5.0,20.0,5.0),
                child: TextFormField(
                  controller: _model.emailController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: "Open Sans",
                    ),
                    hintText: "Username",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color:Colors.blue,
                        width:2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color:Colors.blue,
                        width:2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0,5.0,20.0,5.0),
                child: TextFormField(
                  controller: _model.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: "Open Sans",
                    ),
                    hintText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color:Colors.blue,
                        width:2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color:Colors.blue,
                        width:2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),

                ),
              ),
              ElevatedButton(
                onPressed: () async{
                  User? user = await _login();
                  print(user);
                  if(user != null){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> WeatherScreen()));
                  }
                },
                style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                ),
                  child: const Text(
                      "Log In!",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      color: Colors.blueGrey,
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

   Future<User?> _login() async {
     setState(() {
       _loading = true; // Show loader
     });
     try {
       User? user = await UserAuth.loginUsingEmailPassword(
         email: _model.emailController!.text,
         password: _model.passwordController!.text,
         context: context,
       );
       if (user != null) {
         Navigator.of(context).pushReplacement(MaterialPageRoute(
           builder: (context) => WeatherScreen(),
         ));
       }
     } catch (e) {
       String errorMessage = 'An error occurred. Please try again.';
       if (e is FirebaseAuthException) {
         if (e.code == 'user-not-found' || e.code == 'wrong-password') {
           errorMessage = 'Incorrect email or password. Please try again.';
         } else {
           errorMessage = e.message ?? errorMessage;
         }
       }
       // Show error message
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
     } finally {
       setState(() {
         _loading = false; // Hide loader
       });
     }
   }


   AppBar buildAppBar() {
    return AppBar(
      title: Text("Welcome!!!"),
    );
  }
}
