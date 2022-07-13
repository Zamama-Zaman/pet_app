// To parse this JSON data, do
//
//     final singlePostComment = singlePostCommentFromJson(jsonString);

import 'dart:convert';

class SinglePostComment {
  SinglePostComment({
    this.success,
    this.data,
  });

  final bool? success;
  final List<Datum>? data;

  factory SinglePostComment.fromRawJson(String str) =>
      SinglePostComment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SinglePostComment.fromJson(dynamic _json) {
    dynamic json = jsonDecode(_json);
    return SinglePostComment(
      success: json["success"],
      data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.commentId,
    this.commentAuthor,
    this.commentAuthorEmail,
    this.commentDate,
    this.commentContent,
    this.commentApproved,
    this.commentType,
    this.commentParent,
    this.userId,
  });

  final String? commentId;
  final String? commentAuthor;
  final String? commentAuthorEmail;
  final DateTime? commentDate;
  final String? commentContent;
  final String? commentApproved;
  final CommentType? commentType;
  final String? commentParent;
  final String? userId;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(dynamic json) => Datum(
        commentId: json["comment_ID"],
        commentAuthor: json["comment_author"],
        commentAuthorEmail: json["comment_author_email"],
        commentDate: DateTime.parse(json["comment_date"]),
        commentContent: json["comment_content"],
        commentApproved: json["comment_approved"],
        commentType: commentTypeValues.map![json["comment_type"]],
        commentParent: json["comment_parent"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "comment_ID": commentId,
        "comment_author": commentAuthor,
        "comment_author_email": commentAuthorEmail,
        "comment_date": commentDate!.toIso8601String(),
        "comment_content": commentContent,
        "comment_approved": commentApproved,
        "comment_type": commentTypeValues.reverse![commentType],
        "comment_parent": commentParent,
        "user_id": userId,
      };
}

enum CommentType { comment }

final commentTypeValues = EnumValues({"comment": CommentType.comment});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    // ignore: prefer_conditional_assignment
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
