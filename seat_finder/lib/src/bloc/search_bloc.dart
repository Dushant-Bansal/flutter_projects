import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template search_cubit}
/// A simple [Cubit] that manages the search index as its state.
/// {@endtemplate}
class SearchCubit extends Cubit<int> {
  /// {@macro search_cubit}
  SearchCubit() : super(0);

  void find(int index) => emit(index);
}
