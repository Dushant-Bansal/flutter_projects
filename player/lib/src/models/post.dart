import 'comment.dart';
import 'creator.dart';
import 'reaction.dart';
import 'submission.dart';

class Post {
  String postId;
  Creator creator;
  Comment comment;
  Reaction reaction;
  Submission submission;

  Post(
      {required this.postId,
      required this.creator,
      required this.comment,
      required this.reaction,
      required this.submission});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        postId: json['postId'],
        creator: Creator.fromJson(json['creator']),
        comment: Comment.fromJson(json['comment']),
        reaction: Reaction.fromJson(json['reaction']),
        submission: Submission.fromJson(json['submission']),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    data['creator'] = creator.toJson();
    data['comment'] = comment.toJson();
    data['reaction'] = reaction.toJson();
    data['submission'] = submission.toJson();
    return data;
  }
}
