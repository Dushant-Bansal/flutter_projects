import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player/src/bloc/data/data_bloc.dart';
import 'package:player/src/bloc/data/data_state.dart';
import 'package:player/src/screens/post_widget.dart';
import 'package:player/src/style/loader.dart';

class Data extends StatefulWidget {
  const Data._(this.page, {this.postNo = 0});

  final int page;
  final int postNo;

  static Widget blocProvider({int page = 0, int? postNo}) {
    return BlocProvider(
      create: (_) {
        return DataCubit(page);
      },
      child: Data._(page, postNo: postNo ?? 0),
    );
  }

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  late PageController controller =
      PageController(initialPage: widget.postNo, viewportFraction: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataState>(
      builder: (_, state) {
        return state.loaded
            ? PageView.builder(
                itemCount: state.data.posts.length,
                controller: controller,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return PostWidget.blocProvider(state.data.posts[index]);
                },
                onPageChanged: (value) {
                  if (value == state.data.posts.length - 1) {
                    BlocProvider.of<DataCubit>(context)
                        .fetchNewPosts(state.page + 1);
                  }
                },
              )
            : const Loader();
      },
    );
  }
}
