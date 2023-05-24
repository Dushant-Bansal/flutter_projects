import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player/src/bloc/data/data_bloc.dart';
import 'package:player/src/bloc/data/data_state.dart';
import 'package:player/src/style/loader.dart';
import 'package:player/src/style/palette.dart';

import 'data.dart';

class Thumbnails extends StatelessWidget {
  const Thumbnails._(this.page);

  final int page;

  static Widget blocProvider({int page = 0}) {
    return BlocProvider(
      create: (_) {
        return DataCubit(page);
      },
      child: Thumbnails._(page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataState>(
      builder: (_, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: state.loaded
              ? GridView.count(
                  padding: const EdgeInsets.all(16.0),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 16,
                  children: List.generate(
                    state.data.posts.length,
                    (index) => ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Container(
                                  color: Palette.background,
                                  child: Data.blocProvider(postNo: index)),
                            )),
                            child: Image.network(
                                state.data.posts[index].submission.thumbnail),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 10,
                            child: Text(
                              state.data.posts[index].submission.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Palette.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : const Loader(),
        );
      },
    );
  }
}
