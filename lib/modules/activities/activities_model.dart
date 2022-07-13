import 'dart:convert';

// Note Dog blog , Cat blog, Activities and Exotic talk are same
class ActivitiesComment {
  ActivitiesComment({
    required this.id,
    required this.post,
    required this.parent,
    required this.author,
    required this.authorName,
    required this.authorUrl,
    required this.date,
    required this.dateGmt,
    required this.content,
    required this.link,
    required this.status,
    required this.type,
    required this.authorAvatarUrls,
    required this.meta,
    required this.links,
  });

  final int id;
  final int post;
  final int parent;
  final int author;
  final String authorName;
  final String authorUrl;
  final DateTime date;
  final DateTime dateGmt;
  final Content content;
  final String link;
  final String status;
  final String type;
  final Map<String, String> authorAvatarUrls;
  final List<dynamic> meta;
  final Links links;

  factory ActivitiesComment.fromRawJson(String str) =>
      ActivitiesComment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ActivitiesComment.fromJson(Map<String, dynamic> json) =>
      ActivitiesComment(
        id: json["id"],
        post: json["post"],
        parent: json["parent"],
        author: json["author"],
        authorName: json["author_name"],
        authorUrl: json["author_url"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        content: Content.fromJson(json["content"]),
        link: json["link"],
        status: json["status"],
        type: json["type"],
        authorAvatarUrls: Map.from(json["author_avatar_urls"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "post": post,
        "parent": parent,
        "author": author,
        "author_name": authorName,
        "author_url": authorUrl,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "content": content.toJson(),
        "link": link,
        "status": status,
        "type": type,
        "author_avatar_urls": Map.from(authorAvatarUrls)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "_links": links.toJson(),
      };
}

class Content {
  Content({
    required this.rendered,
  });

  final String rendered;

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

class Links {
  Links({
    required this.self,
    required this.collection,
    required this.author,
    required this.up,
  });

  final List<Collection> self;
  final List<Collection> collection;
  final List<Author> author;
  final List<Up> up;

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(
            json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(
            json["collection"].map((x) => Collection.fromJson(x))),
        author:
            List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        up: List<Up>.from(json["up"].map((x) => Up.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "up": List<dynamic>.from(up.map((x) => x.toJson())),
      };
}

class Author {
  Author({
    required this.embeddable,
    required this.href,
  });

  final bool embeddable;
  final String href;

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class Collection {
  Collection({
    required this.href,
  });

  final String href;

  factory Collection.fromRawJson(String str) =>
      Collection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Up {
  Up({
    required this.embeddable,
    required this.postType,
    required this.href,
  });

  final bool embeddable;
  final String postType;
  final String href;

  factory Up.fromRawJson(String str) => Up.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Up.fromJson(Map<String, dynamic> json) => Up(
        embeddable: json["embeddable"],
        postType: json["post_type"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "post_type": postType,
        "href": href,
      };
}
