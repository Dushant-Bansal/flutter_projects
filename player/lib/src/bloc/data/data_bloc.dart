import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player/src/models/data.dart';
import '../../services/api.dart';
import 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(int page)
      : super(DataState.initialize(
            page: page, data: Data(posts: [], page: page, offset: page + 1))) {
    // Fetch data from Api
    Api.fetchPosts(page).then((data) {
      emit(state.copyWith(data: data, loaded: true));
    }).onError((error, stackTrace) {
      if (kDebugMode) print('DataBLoc\nError: $error\nStackTrace: $stackTrace');
    });
  }

  void fetchNewPosts(int page) {
    Api.fetchPosts(page).then((data) {
      emit(state.addPosts(posts: data.posts));
    }).onError((error, stackTrace) {
      if (kDebugMode) print('DataBLoc\nError: $error\nStackTrace: $stackTrace');
    });
  }
}
