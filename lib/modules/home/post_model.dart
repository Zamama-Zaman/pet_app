import 'dart:convert';

class PostModel {
  PostModel({
    bool? success,
    PostModelData? data,
  }) {
    _success = success;
    _data = data;
  }

  PostModel.fromJson(dynamic _json) {
    dynamic json = jsonDecode(_json);
    _success = json['success'];
    _data = json['data'] != null ? PostModelData.fromJson(json) : null;
  }
  bool? _success;
  PostModelData? _data;

  bool? get success => _success;
  PostModelData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class PostModelData {
  PostModelData({
    String? currentPage,
    List<PostDetailsData>? data,
    String? nextPageUrl,
    dynamic prevPageUrl,
  }) {
    _currentPage = currentPage;
    _data = data;
    _nextPageUrl = nextPageUrl;
    _prevPageUrl = prevPageUrl;
  }

  PostModelData.fromJson(dynamic json) {
    _currentPage = json['data']['current_page'].toString();
    if (json['data']['data'] != null) {
      _data = [];
      json['data']['data'].forEach((v) {
        _data?.add(PostDetailsData.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _prevPageUrl = json['prev_page_url'];
  }
  String? _currentPage;
  List<PostDetailsData>? _data;
  String? _nextPageUrl;
  dynamic _prevPageUrl;

  String? get currentPage => _currentPage;
  List<PostDetailsData>? get data => _data;
  String? get nextPageUrl => _nextPageUrl;
  dynamic get prevPageUrl => _prevPageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['prev_page_url'] = _prevPageUrl;
    return map;
  }
}

class PostDetailsData {
  PostDetailsData({
    String? id,
    String? postDate,
    String? postContent,
    String? postTitle,
    String? commentStatus,
    String? postName,
    String? postType,
    String? commentCount,
  }) {
    _id = id;
    _postDate = postDate;
    _postContent = postContent;
    _postTitle = postTitle;
    _commentStatus = commentStatus;
    _postName = postName;
    _postType = postType;
    _commentCount = commentCount;
  }

  PostDetailsData.fromJson(dynamic json) {
    _id = json['ID'];
    _postDate = json['post_date'];
    _postContent = json['post_content'];
    _postTitle = json['post_title'];
    _commentStatus = json['comment_status'];
    _postName = json['post_name'];
    _postType = json['post_type'];
    _commentCount = json['comment_count'];
  }
  String? _id;
  String? _postDate;
  String? _postContent;
  String? _postTitle;
  String? _commentStatus;
  String? _postName;
  String? _postType;
  String? _commentCount;

  String? get id => _id;
  String? get postDate => _postDate;
  String? get postContent => _postContent;
  String? get postTitle => _postTitle;
  String? get commentStatus => _commentStatus;
  String? get postName => _postName;
  String? get postType => _postType;
  String? get commentCount => _commentCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = _id;
    map['post_date'] = _postDate;
    map['post_content'] = _postContent;
    map['post_title'] = _postTitle;
    map['comment_status'] = _commentStatus;
    map['post_name'] = _postName;
    map['post_type'] = _postType;
    map['comment_count'] = _commentCount;
    return map;
  }
}
