import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/input.dart';

class SignUp extends StatefulWidget {
   TabController c ;
   SignUp({super.key,required this.c});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _numcontroller = TextEditingController();
    final _passwordcontroller = TextEditingController();
    bool _checked = false;
  @override
 Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
         height: size.height*0.8,
                      width: size.width,
        decoration: BoxDecoration(
          color: Colors.red[50],
          borderRadius: const BorderRadius.all(Radius.circular(65),)),
          child: Padding(
            padding:  EdgeInsets.only(left: size.width*0.1,right:size.width*0.1,top: size.width*0.1 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const Text("Create an\nAccount",style: TextStyle(color: Colors.red,fontSize: 26,fontWeight: FontWeight.bold),),
                 SizedBox(height: size.height*0.02),
              const Text("Name",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                  SizedBox(
                width: size.width*0.83,
                 child: InputWidget(
                    icon: Icons.email,
                    label: "Name",
                    controller: _namecontroller,
                  ),
               ),
                 SizedBox(height: size.height*0.02),
              const Text("Email",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                  SizedBox(
                width: size.width*0.83,
                 child: InputWidget(
                    icon: Icons.email,
                    label: "Email",
                    controller: _emailcontroller,
                  ),
               ),
                 SizedBox(height: size.height*0.02),
    
              const Text("Contact No",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
              Row(children: [
                SizedBox(
                  height: 50,width: 40,
                  child: Image.asset("assets/images/india.png")),
                  Text("IN  +91"),
                  Icon(Icons.arrow_drop_down_outlined),
                  SizedBox(width: size.width*0.4,
                  child: NoInputWidget(controller: _numcontroller,icon: Icons.phone,label: "Number",),)
              ],),
              const Text("Password",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                SizedBox(
                  width:size.width*0.83,
                  child: InputWidget(
                    icon: Icons.password,
                    label: "Password",
                    controller: _passwordcontroller,
                  ),
                ),
                 SizedBox(height: size.height*0.015),
               
               
               Row(
                 children: [
                   Checkbox(value: _checked, onChanged: (val ){setState(() {
                     _checked = val!;
                   }); }),
                   RichText(text:  TextSpan(text: "I agree with ",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w500),children: [
                 TextSpan(text:"terms and conditions",style:  TextStyle(decoration: TextDecoration.underline,color: Colors.red,fontSize: 14,fontWeight: FontWeight.bold),recognizer: TapGestureRecognizer()..onTap = (){
                  widget.c.animateTo((widget.c.index + 1 )%2);
                 } )
    
               ])),
                 ],
               ),
                 SizedBox(height: size.height*0.018), 
               RichText(text:  TextSpan(text: "Already have an account ",style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w500),children: [
                 TextSpan(text:"Sign Up!",style: TextStyle(color: Colors.red,fontSize: 17,fontWeight: FontWeight.bold),recognizer: TapGestureRecognizer()..onTap = (){
                  widget.c.animateTo((widget.c.index + 1 )%2);
                 } )
    
               ])),
            ]),
          ),
    
      ),
    );
  }
}