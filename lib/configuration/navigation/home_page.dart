import 'package:books_storage/domain/models/book_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void onTapActiveFilledButton() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BookShortInfoWidget(
        bookInfo: BookInfo(
          title: 'Песнь льда и пламени',
          author: 'Джордж Мартин',
          year: 1996,
          publisher: 'АСТ',
          pageCount: 650,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BookShortInfoWidget extends StatelessWidget {
  final BookInfo bookInfo;

  const BookShortInfoWidget({
    required this.bookInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Название'),
            Text(bookInfo.title),
          ],
        ),
        Row(
          children: [
            Text('Автор'),
            Text(bookInfo.author),
          ],
        ),
        Row(
          children: [
            Text('Год издания'),
            Text(bookInfo.year.toString()),
          ],
        ),
        Row(
          children: [
            Text('Издательство'),
            Text(bookInfo.publisher),
          ],
        ),
        Row(
          children: [
            Text('Количество страниц'),
            Text(bookInfo.pageCount.toString()),
          ],
        ),
      ],
    );
  }
}
