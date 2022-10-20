import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quantapp/pages/login.dart';
import 'package:quantapp/pages/signup.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>  with TickerProviderStateMixin{
  final List<Tab> _tabs = <Tab>[
    Tab(child: Text('Login')),
    Tab(child: Text('SignUp')),
  ];
   late final TabController _controller =
        TabController(length: 2, vsync: this);
    int _index = 0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() { 
      setState(() {
        _index = _controller.index;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text("SocialX",style: TextStyle(fontSize: 22),),),
        body: Container(
          height: size.height,width: size.width,
          child: Column(children: [
              Container(
                  height: size.height*0.15,
                  width: size.width,
                decoration: BoxDecoration(color: Colors.red),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("SocialX",style: TextStyle(color: Colors.white,fontSize: 26,),)),
              ),
                TabBar(
                      indicator: const BoxDecoration(
                          color:Colors.red,
                             borderRadius: BorderRadius.only(
                               bottomLeft:
                                   Radius.circular(12.0),
                                   bottomRight: 
                                   Radius.circular(12.0),
              
                             )

                          ),
                      labelColor:  Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.transparent,
                      controller: _controller,
                      tabs: _tabs),
                  Expanded(
                    // height: size.height*0.7333,
                    // width: size.width,
                    // color: Colors.amber,
                    child: TabBarView(controller: _controller, children: [
                      LogIn( c: _controller,),
                       SignUp(c:  _controller,)
                    ]
                    ),)
          
          ]),
        ),
      ),
    );
  }
}