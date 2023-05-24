import 'package:player/src/models/data.dart';
import '../../models/post.dart';

class DataState {
  DataState._({
    required this.data,
    required this.page,
    required this.loaded,
  });

  final Data data;
  final int page;
  final bool loaded;

  factory DataState.initialize({required int page, required Data data}) {
    return DataState._(
      data: data,
      page: page,
      loaded: false,
    );
  }

  DataState copyWith({Data? data, int? page, bool? loaded}) {
    return DataState._(
      data: data ?? this.data,
      page: page ?? this.page,
      loaded: loaded ?? this.loaded,
    );
  }

  DataState addPosts({required List<Post> posts}) {
    return DataState._(
      data: Data(posts: data.posts + posts, page: page + 1, offset: page + 2),
      page: page + 1,
      loaded: loaded,
    );
  }
}
