import 'dart:convert';

class NewPostModel {
  NewPostModel({
    required this.id,
    required this.date,
    required this.dateGmt,
    required this.guid,
    required this.modified,
    required this.modifiedGmt,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.author,
    required this.featuredMedia,
    required this.commentStatus,
    required this.pingStatus,
    required this.sticky,
    required this.template,
    required this.format,
    required this.meta,
    required this.categories,
    required this.tags,
    required this.yoastHead,
    required this.yoastHeadJson,
    required this.links,
  });

  final int id;
  final DateTime date;
  final DateTime dateGmt;
  final Guid guid;
  final DateTime modified;
  final DateTime modifiedGmt;
  final String slug;
  final String status;
  final String type;
  final String link;
  final Guid title;
  final Content content;
  final Content excerpt;
  final int author;
  final int featuredMedia;
  final String commentStatus;
  final String pingStatus;
  final bool sticky;
  final String template;
  final String format;
  final Meta meta;
  final List<int> categories;
  final List<dynamic> tags;
  final String yoastHead;
  final YoastHeadJson yoastHeadJson;
  final Links links;

  factory NewPostModel.fromRawJson(String str) =>
      NewPostModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewPostModel.fromJson(Map<String, dynamic> json) => NewPostModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        sticky: json["sticky"],
        template: json["template"],
        format: json["format"],
        meta: Meta.fromJson(json["meta"]),
        categories: List<int>.from(json["categories"].map((x) => x)),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        yoastHead: json["yoast_head"],
        yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "excerpt": excerpt.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "sticky": sticky,
        "template": template,
        "format": format,
        "meta": meta.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "yoast_head": yoastHead,
        "yoast_head_json": yoastHeadJson.toJson(),
        "_links": links.toJson(),
      };
}

class Content {
  Content({
    required this.rendered,
    required this.protected,
  });

  final String rendered;
  final bool protected;

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Guid {
  Guid({
    required this.rendered,
  });

  final String rendered;

  factory Guid.fromRawJson(String str) => Guid.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
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
    required this.about,
    required this.author,
    required this.replies,
    required this.versionHistory,
    required this.predecessorVersion,
    required this.wpFeaturedmedia,
    required this.wpAttachment,
    required this.wpTerm,
    required this.curies,
  });

  final List<About> self;
  final List<About> collection;
  final List<About> about;
  final List<AuthorElement> author;
  final List<AuthorElement> replies;
  final List<VersionHistory> versionHistory;
  final List<PredecessorVersion> predecessorVersion;
  final List<AuthorElement> wpFeaturedmedia;
  final List<About> wpAttachment;
  final List<WpTerm> wpTerm;
  final List<Cury> curies;

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<AuthorElement>.from(
            json["author"].map((x) => AuthorElement.fromJson(x))),
        replies: List<AuthorElement>.from(
            json["replies"].map((x) => AuthorElement.fromJson(x))),
        versionHistory: List<VersionHistory>.from(
            json["version-history"].map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: List<PredecessorVersion>.from(
            json["predecessor-version"]
                .map((x) => PredecessorVersion.fromJson(x))),
        wpFeaturedmedia: List<AuthorElement>.from(
            json["wp:featuredmedia"].map((x) => AuthorElement.fromJson(x))),
        wpAttachment: List<About>.from(
            json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm:
            List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "version-history":
            List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "predecessor-version":
            List<dynamic>.from(predecessorVersion.map((x) => x.toJson())),
        "wp:featuredmedia":
            List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:attachment":
            List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
      };
}

class About {
  About({
    required this.href,
  });

  final String href;

  factory About.fromRawJson(String str) => About.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class AuthorElement {
  AuthorElement({
    required this.embeddable,
    required this.href,
  });

  final bool embeddable;
  final String href;

  factory AuthorElement.fromRawJson(String str) =>
      AuthorElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthorElement.fromJson(Map<String, dynamic> json) => AuthorElement(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class Cury {
  Cury({
    required this.name,
    required this.href,
    required this.templated,
  });

  final String name;
  final String href;
  final bool templated;

  factory Cury.fromRawJson(String str) => Cury.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
      };
}

class PredecessorVersion {
  PredecessorVersion({
    required this.id,
    required this.href,
  });

  final int id;
  final String href;

  factory PredecessorVersion.fromRawJson(String str) =>
      PredecessorVersion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) =>
      PredecessorVersion(
        id: json["id"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
      };
}

class VersionHistory {
  VersionHistory({
    required this.count,
    required this.href,
  });

  final int count;
  final String href;

  factory VersionHistory.fromRawJson(String str) =>
      VersionHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
      };
}

class WpTerm {
  WpTerm({
    required this.taxonomy,
    required this.embeddable,
    required this.href,
  });

  final String taxonomy;
  final bool embeddable;
  final String href;

  factory WpTerm.fromRawJson(String str) => WpTerm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: json["taxonomy"],
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomy,
        "embeddable": embeddable,
        "href": href,
      };
}

class Meta {
  Meta({
    required this.pmproDefaultLevel,
  });

  final int pmproDefaultLevel;

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pmproDefaultLevel: json["pmpro_default_level"],
      );

  Map<String, dynamic> toJson() => {
        "pmpro_default_level": pmproDefaultLevel,
      };
}

class YoastHeadJson {
  YoastHeadJson({
    required this.title,
    required this.description,
    required this.robots,
    required this.canonical,
    required this.ogLocale,
    required this.ogType,
    required this.ogTitle,
    required this.ogDescription,
    required this.ogUrl,
    required this.ogSiteName,
    required this.articlePublishedTime,
    required this.articleModifiedTime,
    required this.ogImage,
    required this.twitterCard,
    required this.twitterMisc,
    required this.schema,
  });

  final String title;
  final String description;
  final Robots robots;
  final String canonical;
  final String ogLocale;
  final String ogType;
  final String ogTitle;
  final String ogDescription;
  final String ogUrl;
  final String ogSiteName;
  final DateTime articlePublishedTime;
  final DateTime articleModifiedTime;
  final List<OgImage> ogImage;
  final String twitterCard;
  final TwitterMisc twitterMisc;
  final Schema schema;

  factory YoastHeadJson.fromRawJson(String str) =>
      YoastHeadJson.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
        title: json["title"],
        description: json["description"],
        robots: Robots.fromJson(json["robots"]),
        canonical: json["canonical"],
        ogLocale: json["og_locale"],
        ogType: json["og_type"],
        ogTitle: json["og_title"],
        ogDescription: json["og_description"],
        ogUrl: json["og_url"],
        ogSiteName: json["og_site_name"],
        articlePublishedTime: DateTime.parse(json["article_published_time"]),
        articleModifiedTime: DateTime.parse(json["article_modified_time"]),
        ogImage: List<OgImage>.from(
            json["og_image"].map((x) => OgImage.fromJson(x))),
        twitterCard: json["twitter_card"],
        twitterMisc: TwitterMisc.fromJson(json["twitter_misc"]),
        schema: Schema.fromJson(json["schema"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "robots": robots.toJson(),
        "canonical": canonical,
        "og_locale": ogLocale,
        "og_type": ogType,
        "og_title": ogTitle,
        "og_description": ogDescription,
        "og_url": ogUrl,
        "og_site_name": ogSiteName,
        "article_published_time": articlePublishedTime.toIso8601String(),
        "article_modified_time": articleModifiedTime.toIso8601String(),
        "og_image": List<dynamic>.from(ogImage.map((x) => x.toJson())),
        "twitter_card": twitterCard,
        "twitter_misc": twitterMisc.toJson(),
        "schema": schema.toJson(),
      };
}

class OgImage {
  OgImage({
    required this.width,
    required this.height,
    required this.url,
    required this.type,
  });

  final int width;
  final int height;
  final String url;
  final String type;

  factory OgImage.fromRawJson(String str) => OgImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
        "type": type,
      };
}

class Robots {
  Robots({
    required this.index,
    required this.follow,
    required this.maxSnippet,
    required this.maxImagePreview,
    required this.maxVideoPreview,
  });

  final String index;
  final String follow;
  final String maxSnippet;
  final String maxImagePreview;
  final String maxVideoPreview;

  factory Robots.fromRawJson(String str) => Robots.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index: json["index"],
        follow: json["follow"],
        maxSnippet: json["max-snippet"],
        maxImagePreview: json["max-image-preview"],
        maxVideoPreview: json["max-video-preview"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "follow": follow,
        "max-snippet": maxSnippet,
        "max-image-preview": maxImagePreview,
        "max-video-preview": maxVideoPreview,
      };
}

class Schema {
  Schema({
    required this.context,
    required this.graph,
  });

  final String context;
  final List<Graph> graph;

  factory Schema.fromRawJson(String str) => Schema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: List<Graph>.from(json["@graph"].map((x) => Graph.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": List<dynamic>.from(graph.map((x) => x.toJson())),
      };
}

class Graph {
  Graph({
    required this.type,
    required this.id,
    required this.name,
    required this.url,
    required this.sameAs,
    required this.logo,
    required this.image,
    required this.description,
    required this.publisher,
    required this.potentialAction,
    required this.inLanguage,
    required this.contentUrl,
    required this.width,
    required this.height,
    required this.isPartOf,
    required this.primaryImageOfPage,
    required this.datePublished,
    required this.dateModified,
    required this.breadcrumb,
    required this.itemListElement,
    required this.author,
    required this.headline,
    required this.mainEntityOfPage,
    required this.wordCount,
    required this.commentCount,
    required this.thumbnailUrl,
    required this.articleSection,
  });

  final String type;
  final String id;
  final String name;
  final String url;
  final List<dynamic> sameAs;
  final Image logo;
  final Image image;
  final String description;
  final BreadcrumbClass publisher;
  final List<PotentialAction> potentialAction;
  final String inLanguage;
  final String contentUrl;
  final int width;
  final int height;
  final BreadcrumbClass isPartOf;
  final BreadcrumbClass primaryImageOfPage;
  final DateTime datePublished;
  final DateTime dateModified;
  final BreadcrumbClass breadcrumb;
  final List<ItemListElement> itemListElement;
  final BreadcrumbClass author;
  final String headline;
  final BreadcrumbClass mainEntityOfPage;
  final int wordCount;
  final int commentCount;
  final String thumbnailUrl;
  final List<String> articleSection;

  factory Graph.fromRawJson(String str) => Graph.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type: json["@type"],
        id: json["@id"],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
        sameAs: List<dynamic>.from(json["sameAs"].map((x) => x)),
        logo: Image.fromJson(json["logo"]),
        image: Image.fromJson(json["image"]),
        description: json["description"] == null ? null : json["description"],
        publisher:
            json["publisher"] ?? BreadcrumbClass.fromJson(json["publisher"]),
        potentialAction: json["potentialAction"] ??
            List<PotentialAction>.from(json["potentialAction"]
                .map((x) => PotentialAction.fromJson(x))),
        inLanguage: json["inLanguage"] == null ? null : json["inLanguage"],
        contentUrl: json["contentUrl"] == null ? null : json["contentUrl"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        isPartOf:
            json["isPartOf"] ?? BreadcrumbClass.fromJson(json["isPartOf"]),
        primaryImageOfPage: json["primaryImageOfPage"] ??
            BreadcrumbClass.fromJson(json["primaryImageOfPage"]),
        datePublished:
            json["datePublished"] ?? DateTime.parse(json["datePublished"]),
        dateModified:
            json["dateModified"] ?? DateTime.parse(json["dateModified"]),
        breadcrumb:
            json["breadcrumb"] ?? BreadcrumbClass.fromJson(json["breadcrumb"]),
        itemListElement: json["itemListElement"] ??
            List<ItemListElement>.from(json["itemListElement"]
                .map((x) => ItemListElement.fromJson(x))),
        author: json["author"] ?? BreadcrumbClass.fromJson(json["author"]),
        headline: json["headline"] == null ? null : json["headline"],
        mainEntityOfPage: json["mainEntityOfPage"] ??
            BreadcrumbClass.fromJson(json["mainEntityOfPage"]),
        wordCount: json["wordCount"] == null ? null : json["wordCount"],
        commentCount:
            json["commentCount"] == null ? null : json["commentCount"],
        thumbnailUrl:
            json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
        articleSection: json["articleSection"] ??
            List<String>.from(json["articleSection"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "@id": id,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
        "sameAs":
            sameAs == null ? null : List<dynamic>.from(sameAs.map((x) => x)),
        "logo": logo == null ? null : logo.toJson(),
        "image": image == null ? null : image.toJson(),
        "description": description == null ? null : description,
        "publisher": publisher == null ? null : publisher.toJson(),
        "potentialAction": potentialAction == null
            ? null
            : List<dynamic>.from(potentialAction.map((x) => x.toJson())),
        "inLanguage": inLanguage == null ? null : inLanguage,
        "contentUrl": contentUrl == null ? null : contentUrl,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "isPartOf": isPartOf == null ? null : isPartOf.toJson(),
        "primaryImageOfPage":
            primaryImageOfPage == null ? null : primaryImageOfPage.toJson(),
        "datePublished":
            datePublished == null ? null : datePublished.toIso8601String(),
        "dateModified":
            dateModified == null ? null : dateModified.toIso8601String(),
        "breadcrumb": breadcrumb == null ? null : breadcrumb.toJson(),
        "itemListElement": itemListElement == null
            ? null
            : List<dynamic>.from(itemListElement.map((x) => x.toJson())),
        "author": author == null ? null : author.toJson(),
        "headline": headline == null ? null : headline,
        "mainEntityOfPage":
            mainEntityOfPage == null ? null : mainEntityOfPage.toJson(),
        "wordCount": wordCount == null ? null : wordCount,
        "commentCount": commentCount == null ? null : commentCount,
        "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
        "articleSection": articleSection == null
            ? null
            : List<dynamic>.from(articleSection.map((x) => x)),
      };
}

class BreadcrumbClass {
  BreadcrumbClass({
    required this.id,
  });

  final String id;

  factory BreadcrumbClass.fromRawJson(String str) =>
      BreadcrumbClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BreadcrumbClass.fromJson(Map<String, dynamic> json) =>
      BreadcrumbClass(
        id: json["@id"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
      };
}

class Image {
  Image({
    required this.id,
    required this.type,
    required this.inLanguage,
    required this.url,
    required this.contentUrl,
    required this.caption,
  });

  final String id;
  final String type;
  final String inLanguage;
  final String url;
  final String contentUrl;
  final String caption;

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["@id"],
        type: json["@type"] == null ? null : json["@type"],
        inLanguage: json["inLanguage"] == null ? null : json["inLanguage"],
        url: json["url"] == null ? null : json["url"],
        contentUrl: json["contentUrl"] == null ? null : json["contentUrl"],
        caption: json["caption"] == null ? null : json["caption"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type == null ? null : type,
        "inLanguage": inLanguage == null ? null : inLanguage,
        "url": url == null ? null : url,
        "contentUrl": contentUrl == null ? null : contentUrl,
        "caption": caption == null ? null : caption,
      };
}

class ItemListElement {
  ItemListElement({
    required this.type,
    required this.position,
    required this.name,
    required this.item,
  });

  final String type;
  final int position;
  final String name;
  final String item;

  factory ItemListElement.fromRawJson(String str) =>
      ItemListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemListElement.fromJson(Map<String, dynamic> json) =>
      ItemListElement(
        type: json["@type"],
        position: json["position"],
        name: json["name"],
        item: json["item"] == null ? null : json["item"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "position": position,
        "name": name,
        "item": item == null ? null : item,
      };
}

class PotentialAction {
  PotentialAction({
    required this.type,
    required this.target,
    required this.queryInput,
    required this.name,
  });

  final String type;
  final dynamic target;
  final String queryInput;
  final String name;

  factory PotentialAction.fromRawJson(String str) =>
      PotentialAction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PotentialAction.fromJson(Map<String, dynamic> json) =>
      PotentialAction(
        type: json["@type"],
        target: json["target"],
        queryInput: json["query-input"] == null ? null : json["query-input"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "target": target,
        "query-input": queryInput == null ? null : queryInput,
        "name": name == null ? null : name,
      };
}

class TargetClass {
  TargetClass({
    required this.type,
    required this.urlTemplate,
  });

  final String type;
  final String urlTemplate;

  factory TargetClass.fromRawJson(String str) =>
      TargetClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
        type: json["@type"],
        urlTemplate: json["urlTemplate"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "urlTemplate": urlTemplate,
      };
}

class TwitterMisc {
  TwitterMisc({
    required this.writtenBy,
    required this.estReadingTime,
  });

  final String writtenBy;
  final String estReadingTime;

  factory TwitterMisc.fromRawJson(String str) =>
      TwitterMisc.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
        writtenBy: json["Written by"],
        estReadingTime: json["Est. reading time"],
      );

  Map<String, dynamic> toJson() => {
        "Written by": writtenBy,
        "Est. reading time": estReadingTime,
      };
}
