import 'package:flutter/material.dart';
import 'package:myfirstproject/utlis/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // const LoginPage({ Key? key }) : super(key: key);
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    if(_formkey.currentState!.validate()){
                      setState(() {
                        changeButton = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      await Navigator.pushNamed(context,MyRoutes.homeRoute);
                      setState(() {
                        changeButton = false;
                      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key : _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png",
              fit: BoxFit.cover,
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ),
               SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Username cannot be empty";
                    }
                    return null;
                  },
                  onChanged: (value){
                    name = value;
                    setState(() {});
                  },//validator
                ),
              
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Password cannot be empty";
                    }
                    else if(value.length<6){
                      return "password length should be atleast 6";
                    }
                    return null;
                  },//validator
                ),
                SizedBox(
                height: 20.0,
              ),
        
                Material(
                  color : Colors.blue,
                  borderRadius: BorderRadius.circular(changeButton?40 :7),
                  child: InkWell(
                    onTap:  () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changeButton? 40 : 90,
                    height: 40,
                    // color: Colors.deepPurple,
                    alignment: Alignment.center,
                    child: changeButton
                    ? Icon(
                      Icons.done, 
                       color: Colors.white,
                       )
                       : Text(
                      "login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                        // shape: changeButton? BoxShape.circle : BoxShape.rectangle,
                        // borderRadius: BorderRadius.circular(changeButton?40 :7),
                  ),
                            ),
                )
              // ElevatedButton(
              //   child: Text(
              //     "Login",
              //     style: TextStyle(
              //       fontSize: 20,
              //     ),
              //     ),
              //   style: TextButton.styleFrom(minimumSize: Size(100, 40)),
              //   onPressed: (){
              //     Navigator.pushNamed(context,MyRoutes.homeRoute);
              // },
              // )
              
                  ],
                ),
              )
              
            ],
          ),
        ),
      )     
    );
  }
}