import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:quantapp/controllers/getNews.dart';
import 'package:quantapp/model/articles.dart';
import '../controllers/auth.dart';
import '../widgets/newsTitle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchTextController  =  new TextEditingController();
  bool found = true;
  String searchText = "";
Widget appBarTitle =  Text("SocialX");
final _getNews = NewsGet();
bool _isLoaded  = false;
   List<Articles>? _listArticles ;
   List<Articles>? _filterdArticles ;
  Icon actionIcon = const  Icon(Icons.search);
 Future<List<Articles>?>  getter() async {
try{ 
  var cl = http.Client();
  var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&sortBy=publishedAt&apiKey=042c46327d674bb5836f4e7b5e44fdca");
  // var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0b5e9e50c60048a19d8f05e7f5d2d93c");
   
   var response = await  cl.get(url);
        var jsonData = jsonDecode(response.body);

  //  print(jsonData);
   var data1 = AutoGenerate.fromJson(jsonData);
    print(data1.articles);
    //  for(int i = 0; i<_listArticles!.length;i++){
    //   print("${_listArticles![0].urlToImage}\n");
    //  }

    setState(() {
    _isLoaded = true;
      
    });
  
    return data1.articles;

    }
    catch(e){
      print("-->>Error" + e.toString());
      _isLoaded =false;
    }
  }
@override
  void initState() {
     getter().then((value){_listArticles = value!;
     _filterdArticles = _listArticles;
          }) ;
     searchTextController.addListener(() {
      if(searchTextController.text.isEmpty){
           setState(() {
             searchText = "";
          found = true;
     _filterdArticles = _listArticles;
           });
      }
      else{
        setState(() {
          searchText = searchTextController.text.trim();
        searchFunc();
        });
      }
      });
    super.initState();
  }
  searchFunc(){
    List<Articles>? tempArticles;
    if (searchText.isNotEmpty) {
      for (int i = 0; i < _listArticles!.length; i++) {
        if (_listArticles![i].title.toLowerCase().contains(searchText.toLowerCase())) {
          tempArticles!.add(_listArticles![i]);
        }
      }
      setState(() {
        print(tempArticles!.length);
        found = true;
        _filterdArticles = tempArticles;
      });
    }
    if (_filterdArticles!.isEmpty) {
      setState(() {
        found = false;
      });
    }

  }
  @override
   Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     appBar:  AppBar(
        centerTitle: true,
        title:appBarTitle,
        actions: <Widget>[
           IconButton(icon: actionIcon,onPressed:(){
          setState(() {
                     if ( actionIcon.icon == Icons.search){
                      actionIcon = const  Icon(Icons.close);
                    appBarTitle =  TextField(
                      controller: searchTextController,
                        style: const TextStyle(
                          color: Colors.white,

                        ),
                        decoration:  const InputDecoration(
                          prefixIcon:  Icon(Icons.search,color: Colors.white),
                          hintText: "Search...",
                          hintStyle:  TextStyle(color: Colors.white)
                        ),
                      );}
                      else {
                        actionIcon = const Icon(Icons.search);
                        appBarTitle =const   Text("AppBar Title");
                      }


                    });
        } ,),]
      ),
      body:!_isLoaded ?Center(child: CircularProgressIndicator(color: Colors.red,)):
      found?
       ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          //itemCount: newslist.length,
          itemCount: _filterdArticles?.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
           
            // return (_listArticles![index].title != null || 
            //         _listArticles![index].description !=null ||                    
            //         _listArticles![index].urlToImage != null ||
            //         _listArticles![index].source.name != null ||
            //         _listArticles![index].publishedAt != null
            //         )
            return _filterdArticles![index].urlToImage != Null
                ? NewsTile(
                    imgUrl: _filterdArticles?[index].urlToImage??"" ,
                     desc: _filterdArticles?[index].description ?? "",
                    title: _filterdArticles?[index].title ?? "",
                    sourceName: _filterdArticles?[index].source.name ?? "",
                    publishedat: _filterdArticles?[index].publishedAt ?? ""
                    ):const SizedBox(
                    width: 0.0,
                    height: 0.0,
                  );
                
          }):Center(child: Text("Not Found",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
      drawer: Drawer(  
        child: ListView(  
          // Important: Remove any padding from the ListView.  
          padding: EdgeInsets.zero,  
          children: <Widget>[  
            UserAccountsDrawerHeader(  
              accountName: Text(FirebaseAuth.instance.currentUser!.displayName!,),  
              accountEmail: Text(FirebaseAuth.instance.currentUser!.email! ),  
              currentAccountPicture: ClipRRect(  
                // radius: 100,
                // backgroundColor: Colors.orange, 
                borderRadius: BorderRadius.circular(80.0), 
                child:Image.network(FirebaseAuth.instance.currentUser!.photoURL! )  
              ),  
            ),  
            ListTile(  
              leading: Icon(Icons.home), title: Text("Home"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ),  
            ListTile(  
              leading: Icon(Icons.settings), title: Text("Settings"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ),  
            MaterialButton(
              padding: const EdgeInsets.all(10),
              color: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: const Text(
                'LOG OUT',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {
                AuthController().signOut();
              },)
            
          ],  
        ),  
      
      )
    );
  }
}