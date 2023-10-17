import 'package:books_storage/domain/models/book_info.dart';
import 'package:flutter/material.dart';

import 'widgets/short_book_info.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  void onTapActiveFilledButton() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('a'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return BookShortInfoWidget(
            bookInfo: BookInfo(
              title: 'Песнь льда и пламени',
              author: 'Джордж Мартин',
              year: 1996,
              publisher: 'АСТ',
              pageCount: 650,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
