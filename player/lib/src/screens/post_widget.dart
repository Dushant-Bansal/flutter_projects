import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player/src/models/post.dart';
import 'package:video_player/video_player.dart';
import '../bloc/posts/posts.dart';
import '../style/palette.dart';

class PostWidget extends StatefulWidget {
  const PostWidget._(this.post, {Key? key}) : super(key: key);

  static Widget blocProvider(Post post, {String? placeholder}) {
    return BlocProvider(
      create: (_) {
        return PostCubit(post);
      },
      child: PostWidget._(post),
    );
  }

  final Post post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late PostCubit postCubit;

  @override
  void dispose() {
    postCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    postCubit = BlocProvider.of(context);
    return BlocBuilder<PostCubit, PostState>(
      builder: (_, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: Center(
            child: AspectRatio(
              key: ValueKey(state.loaded),
              aspectRatio: 9 / 16,
              child: state.loaded
                  ? Stack(
                      children: [
                        GestureDetector(
                          onTap: BlocProvider.of<PostCubit>(context).togglePlay,
                          child: VideoPlayer(state.controller),
                        ),
                        const Center(child: PlayControl()),
                        Positioned(
                          left: 10,
                          bottom: 20,
                          child: _buildAvatar(context, state),
                        ),
                      ],
                    )
                  : Image.network(state.post.submission.placeholderUrl),
            ),
          ),
        );
      },
    );
  }

  Row _buildAvatar(BuildContext context, PostState state) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24.0,
          backgroundImage: NetworkImage(state.post.creator.pic),
        ),
        const SizedBox(width: 10.0),
        Text(
          state.post.creator.handle,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Palette.white),
        ),
      ],
    );
  }
}

class PlayControl extends StatelessWidget {
  const PlayControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      buildWhen: (previous, current) {
        return previous.playing != current.playing;
      },
      builder: (_, state) {
        return state.playing
            ? Container()
            : GestureDetector(
                onTap: BlocProvider.of<PostCubit>(context).togglePlay,
                child: const Icon(Icons.play_arrow_rounded,
                    color: Colors.black, size: 60),
              );
      },
    );
  }
}
