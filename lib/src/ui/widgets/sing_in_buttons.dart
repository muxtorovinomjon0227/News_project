import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const RegisterPage()));
        },
        child: Text("Login" ,style: TextStyle(color: Colors.white)),
      style: ButtonStyle(

          backgroundColor: MaterialStateProperty.all(Colors.blue),
          padding: MaterialStateProperty.all(EdgeInsets.only(right: 150,left: 150,bottom: 20,top: 20)),
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
    );
  }
}




