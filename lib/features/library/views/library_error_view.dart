import 'package:books_storage/features/library/states/library_states.dart';
import 'package:flutter/material.dart';

class LibraryErrorView extends StatelessWidget {
  final LibraryErrorState state;

  const LibraryErrorView({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(state.message),
    );
  }
}
