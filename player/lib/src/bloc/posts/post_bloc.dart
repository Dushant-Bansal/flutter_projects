import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/post.dart';
import 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(Post post) : super(PostState.initialize(post: post)) {
    state.controller.initialize().then((_) {
      emit(state.copyWith(loaded: true));
      state.controller.play();
    }).onError((error, stackTrace) {
      if (kDebugMode) print('PostBloc\nError: $error\nStackTrace: $stackTrace');
    });
  }

  void togglePlay() {
    state.playing ? state.controller.pause() : state.controller.play();
    emit(state.copyWith(playing: !state.playing));
  }

  void dispose() {
    emit(state.copyWith(playing: false, loaded: false));
    state.dispose();
  }
}
