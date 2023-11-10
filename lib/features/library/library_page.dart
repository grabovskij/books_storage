import 'package:books_storage/domain/models/book_info.dart';
import 'package:books_storage/features/library/controllers/library_manager/library_manager.dart';
import 'package:books_storage/features/library/states/library_states.dart';
import 'package:books_storage/features/stream_listener/stream_builder.dart';
import 'package:flutter/material.dart' hide StreamBuilder;
import 'package:provider/provider.dart';

import 'views/library_error_view.dart';
import 'views/library_loaded_view.dart';
import 'views/library_loading_view.dart';
import 'widgets/book_creation_dialog.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  late final LibraryManager libraryManager;

  @override
  void initState() {
    libraryManager = LibraryManager(context.read())..read();
    super.initState();
  }

  @override
  void dispose() {
    libraryManager.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: libraryManager,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('a'),
        ),
        body: StreamBuilder<LibraryState>(
          initialState: LibraryLoadingState(),
          stream: libraryManager.statesStream,
          builder: (context, state) => switch (state) {
            LibraryLoadingState() => const LibraryLoadingView(),
            LibraryLoadedState() => LibraryLoadedView(state: state),
            LibraryErrorState() => LibraryErrorView(state: state),
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createBook,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void createBook() async {
    final book = await showDialog<BookInfo?>(
      context: context,
      builder: (context) => BookCreationDialog(),
    );

    if (book != null) {
      libraryManager.create(book);
    }
  }
}
