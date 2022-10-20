// class News {
//   String? status;
//   int? totalResults;
//   List<Articles>? articles;

//   News({this.status, this.totalResults, this.articles});

//   News.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     totalResults = json['totalResults'];
//     if (json['articles'] != null) {
//       articles = <Articles>[];
//       json['articles'].forEach((v) {
//         articles!.add( Articles.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['totalResults'] = this.totalResults;
//     if (this.articles != null) {
//       data['articles'] = this.articles!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }

//   rt() {
//     return articles;
//   }
// }


// class CategoryNew {
//   String? status;
//   int? totalResults;
//   List<Articles>? articles;

//   CategoryNew({this.status, this.totalResults, this.articles});

//   CategoryNew.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     totalResults = json['totalResults'];
//     if (json['articles'] != null) {
//       articles = <Articles>[];
//       json['articles'].forEach((v) {
//         articles!.add(new Articles.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['totalResults'] = this.totalResults;
//     if (this.articles != null) {
//       data['articles'] = this.articles!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class SearchNew {
//   String? status;
//   int? totalResults;
//   List<Articles>? articles;

//   SearchNew({this.status, this.totalResults, this.articles});

//   SearchNew.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     totalResults = json['totalResults'];
//     if (json['articles'] != null) {
//       articles = <Articles>[];
//       json['articles'].forEach((v) {
//         articles!.add(new Articles.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['totalResults'] = this.totalResults;
//     if (this.articles != null) {
//       data['articles'] = this.articles!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Articles {
//   Source? source;
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? urlToImage;
//   String? publishedAt;
//   String? content;

//   Articles(
//       {this.source,
//       this.author,
//       this.title,
//       this.description,
//       this.url,
//       this.urlToImage,
//       this.publishedAt,
//       this.content});

//   Articles.fromJson(Map<String, dynamic> json) {
//     if (json['title'] != null &&
//         json['description'] != null &&
//         json['author'] != null &&
//         json['url'] != null &&
//         json['urlToImage'] != null &&
//         json['publishedAt'] != null &&
//         json['content'] != null) {
//       source =
//           json['source'] != null ? new Source.fromJson(json['source']) : null;
//       author = json['author']!;
//       title = json['title']!;
//       description = json['description']!;
//       url = json['url']!;
//       urlToImage = json['urlToImage']!;
//       publishedAt = json['publishedAt']!;
//       content = json['content']!;
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.source != null) {
//       data['source'] = this.source!.toJson();
//     }
//     data['author'] = this.author!;
//     data['title'] = this.title!;
//     data['description'] = this.description!;
//     data['url'] = this.url!;
//     data['urlToImage'] = this.urlToImage!;
//     data['publishedAt'] = this.publishedAt!;
//     data['content'] = this.content!;
//     return data;
//   }
// }

// class Source {
//   String? id;
//   String? name;

//   Source({this.id, this.name});

//   Source.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }



















class AutoGenerate {
  AutoGenerate({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
  late final String status;
  late final int totalResults;
  late final List<Articles> articles;
  
  AutoGenerate.fromJson(Map<String, dynamic> json){
    status = json['status'];
    totalResults = json['totalResults'];
    articles = List.from(json['articles']).map((e)=>Articles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['totalResults'] = totalResults;
    _data['articles'] = articles.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Articles {
  Articles({
    required this.source,
     this.author,
    required this.title,
     this.description,
    required this.url,
     this.urlToImage,
    required this.publishedAt,
     this.content,
  });
  late final Source source;
  late final String? author;
  late final String title;
  late final String? description;
  late final String url;
  late final String? urlToImage;
  late final String publishedAt;
  late final String? content;
  
  Articles.fromJson(Map<String, dynamic> json){
    source = Source.fromJson(json['source']);
    author = null;
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['source'] = source.toJson();
    _data['author'] = author;
    _data['title'] = title;
    _data['description'] = description;
    _data['url'] = url;
    _data['urlToImage'] = urlToImage;
    _data['publishedAt'] = publishedAt;
    _data['content'] = content;
    return _data;
  }
}

class Source {
  Source({
     this.id,
    required this.name,
  });
  late final String? id;
  late final String name;
  
  Source.fromJson(Map<String, dynamic> json){
    id = null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}