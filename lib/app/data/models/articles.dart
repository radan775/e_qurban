import 'dart:convert';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
  List<Article> articles;
  Status status;

  Articles({
    required this.articles,
    required this.status,
  });

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
        "status": status.toJson(),
      };
}

class Article {
  String author;
  int id;
  String title;
  String url;
  String urlToImage;

  Article({
    required this.author,
    required this.id,
    required this.title,
    required this.url,
    required this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        urlToImage: json["urlToImage"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "id": id,
        "title": title,
        "url": url,
        "urlToImage": urlToImage,
      };
}

class Status {
  String status;

  Status({
    required this.status,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
