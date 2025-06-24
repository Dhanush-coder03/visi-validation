import 'package:flutter/material.dart';


class Qwww extends StatefulWidget {
  const Qwww({super.key});

  @override
  State<Qwww> createState() => _QwwwState();
}

class _QwwwState extends State<Qwww> {

  final _key = GlobalKey<FormState>();

  bool _show1 = false;

  TextEditingController ctrl = TextEditingController();
  TextEditingController ctrl1 = TextEditingController();
  TextEditingController ctrl2 = TextEditingController();
  TextEditingController ctrl3 = TextEditingController();
  a(){
    if( ctrl.text.isNotEmpty && ctrl1.text.isNotEmpty && ctrl2.text.isNotEmpty && ctrl3.text.isNotEmpty ){
      setState(() {
        _show1 = true;
      });
    }
    else{
      setState(() {
        _show1 =false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Login Page"),
      ),
      body: Form(
          key: _key,
      child: Column(
          children: [
            TextFormField(
              controller: ctrl,
              onChanged: (i){
                a();

              },
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Enter Your Name",
                border: OutlineInputBorder(),
              ),
              validator: (input)
              {
                if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$').hasMatch(input!))
                {
                  return "Provide valid Name";

                }
                return null;
              },
            ),
            TextFormField(
              controller: ctrl1,
              onChanged: (i){
                a();

              },
              decoration: InputDecoration(
                icon: Icon(Icons.password),
                hintText: "Enter Your Password",
                border: OutlineInputBorder(),
              ),
              validator: (input){
                if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(input!))
                {
                  return " Provide Valid Password";
                }
                return null ;
              },
            ),
            TextFormField(
              controller: ctrl2,
              onChanged: (i){
                a();

              },
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                hintText: "Enter Your Mobile Number",
                border: OutlineInputBorder(),
              ),
              validator: (input){
                if(!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(input!))
                {

                 return "Provide Valid Number";

                }
                return null;
              },
            ),
            TextFormField(
              controller: ctrl3,
              onChanged: (i){
                a();

              },
              decoration: InputDecoration(
                icon: Icon(Icons.mail),
                hintText: "Enter Your Mail",
                border: OutlineInputBorder(),
              ),
              validator: (input){

                if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input!)){

                  return "Provide Your Mail";

                }
                return null;
              },

            ),
            SizedBox(height: 50,),
            Visibility(
              visible: _show1,
              child: ElevatedButton(onPressed: ()
              {
                if(_key.currentState!.validate()){

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged IN")));

                }

              }, child: Text("Sign In")),

            )
        ],
      ),
      ),
    );
  }
}
