import 'post.dart';

class Data {
  List<Post> posts;
  int page;
  int offset;

  Data({required this.posts, required this.page, required this.offset});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        posts: (json['posts'] as List<dynamic>)
            .map((post) => Post.fromJson(post as Map<String, dynamic>))
            .toList(),
        page: json['page'],
        offset: json['offset'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['posts'] = posts.map((v) => v.toJson()).toList();
    data['page'] = page;
    data['offset'] = offset;
    return data;
  }
}
