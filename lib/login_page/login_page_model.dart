import 'package:flutter/cupertino.dart';

class LoginPageModel{
  final unfocusNode = FocusNode();

  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  String? _userNameControllerValidator(BuildContext context, String? val) {
    if(val == null || val.isEmpty) {
      return "Please enter your Username";
    }
    return null;
}

  TextEditingController? passwordController;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if(val == null || val.isEmpty) {
      return "Please enter your Password";
    }
    return null;
  }

  void initState(BuildContext context){
   userNameControllerValidator = _userNameControllerValidator;
   passwordControllerValidator = _passwordControllerValidator;
  }

  void dispose(){
    unfocusNode.dispose();
    userNameController?.dispose();
    passwordController?.dispose();
  }

}