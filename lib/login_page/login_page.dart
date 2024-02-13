import 'package:flutter/material.dart';
import 'package:weather_assignment/login_page/login_page_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   late LoginPageModel _model;
   final scaffoldKey = GlobalKey<ScaffoldState>();

   @override
   void initState(){
     _model = LoginPageModel();
     _model.userNameController ??= TextEditingController();
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
                  controller: _model.userNameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: "Open Sans",
                    ),
                    hintText: "Username",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:Colors.blue,
                        width:2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
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
                    labelStyle: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: "Open Sans",
                    ),
                    hintText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:Colors.blue,
                        width:2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:Colors.blue,
                        width:2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),

                ),
              ),
              ElevatedButton(
                onPressed: (){},
                style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                ),
                  child: Text(
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

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Welcome!!!"),
    );
  }
}
