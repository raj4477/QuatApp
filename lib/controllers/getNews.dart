import 'dart:convert';

// import 'package:new_app/models/article.dart';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' ;
import '../model/articles.dart';
import 'getNews.dart';

var data;
var dataCategory;
var dataSearch;
List <Articles> news = [];

List <Articles> searchNewsList = [];

class NewsGet{
  //  List <Article> news = [];


Future<List<Articles>?> getNews() async {
   var url1 = Uri.https('newsapi.org','/v2/top-headlines',{"country":"in","sortBy":"publishedAt","language":"en","apiKey":"5d64fe53dfa14ffcb3bc8cf861ed593a"});
  // final c = Dio();
  try{ 
  //  var response = await  get(url1);
  // var response = await c.get("https://newsapi.org/v2/top-headlines?country=in&sortBy=publishedAt&apiKey=5d64fe53dfa14ffcb3bc8cf861ed593a");
  // print(response.toString()+ "Hello");
  
    //  var jsonData = jsonDecode(response.data);
// print(jsonData+ "JsonData****" );
  // response. ==200?print('ok'):print('bad');
    // data= News.fromJson(response.data); --->> New model
    print(data + "Data ***" );
   news =data.articles!;
   print (news);
  return news;
    }
  catch(e){
   print(e);
  }

}
}


Future <void> getCategoryNews(String category) async{
    var url = Uri.http('newsapi.org','/v2/top-headlines',{"country":"in","category":category,"sortBy":"publishedAt","language":"en","apiKey":"0b5e9e50c60048a19d8f05e7f5d2d93c"});

  try{
    var response = await get(url);
   var jsonData = jsonDecode(response.body);
    // dataCategory = CategoryNew.fromJson(jsonData);
  

  }
  catch(e){
    print(e);
  }
}

Future <void> getSearchedNews (String query) async {
  var url = Uri.https('newsapi.org', '/v2/everything',{"q":query,"from":"2022-01-19","to":"2022-01-20","sortBy":"popularity","apiKey":"0b5e9e50c60048a19d8f05e7f5d2d93c"});
  // var url1 ="https://newsapi.org/v2/everything?q=apple&from=2022-01-18&to=2022-01-18&sortBy=popularity&apiKey=0b5e9e50c60048a19d8f05e7f5d2d93c";
 Future.delayed(Duration(seconds: 1));
  try{
    var response = await get(url);
   var jsonData = jsonDecode(response.body);
    // dataSearch = SearchNew.fromJson(jsonData);
    searchNewsList = dataSearch.articles!;
  }
  catch(err){print(err);}
}