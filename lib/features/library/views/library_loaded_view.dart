import 'package:books_storage/features/library/states/library_states.dart';
import 'package:books_storage/features/library/widgets/short_book_info.dart';
import 'package:flutter/material.dart';

class LibraryLoadedView extends StatefulWidget {
  final LibraryLoadedState state;

  const LibraryLoadedView({
    required this.state,
    super.key,
  });

  @override
  State<LibraryLoadedView> createState() => _LibraryLoadedViewState();
}

class _LibraryLoadedViewState extends State<LibraryLoadedView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.state.books.length,
      itemBuilder: (context, index) {
        return BookShortInfoWidget(
          bookInfo: widget.state.books[index],
        );
      },
    );
  }
}
