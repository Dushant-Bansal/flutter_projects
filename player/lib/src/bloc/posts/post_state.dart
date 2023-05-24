import 'package:player/src/models/post.dart';
import 'package:video_player/video_player.dart';

class PostState {
  PostState._(
      {required this.controller,
      required this.post,
      required this.loaded,
      required this.playing});

  final VideoPlayerController controller;
  final Post post;
  final bool loaded;
  final bool playing;

  factory PostState.initialize({required Post post}) {
    final controller = VideoPlayerController.network(post.submission.mediaUrl);
    controller.setLooping(true);

    return PostState._(
      controller: controller,
      post: post,
      loaded: false,
      playing: true,
    );
  }

  PostState copyWith({
    VideoPlayerController? controller,
    Post? post,
    bool? loaded,
    bool? playing,
  }) {
    return PostState._(
      controller: controller ?? this.controller,
      post: post ?? this.post,
      loaded: loaded ?? this.loaded,
      playing: playing ?? this.playing,
    );
  }

  Future<void> dispose() async {
    controller.dispose();
  }
}
