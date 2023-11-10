import 'package:books_storage/core/extensions/widget_padding_extension.dart';
import 'package:books_storage/domain/models/book_info.dart';
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

class BookShortInfoWidget extends StatelessWidget {
  final BookInfo bookInfo;

  const BookShortInfoWidget({
    required this.bookInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const ColoredBox(
            color: Colors.black26,
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              bookInfo.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (bookInfo.author.isEmpty)
              Text(bookInfo.author).paddingOnly(top: 4),
            Row(
              children: [
                Text('Год: '),
                Text(bookInfo.year.toString()),
              ],
            ).paddingOnly(top: 4),
            Row(
              children: [
                Text('Издательство: '),
                Text(bookInfo.publisher),
              ],
            ).paddingOnly(top: 4),
            Text('${bookInfo.pageCount} стр.').paddingOnly(top: 4),
          ],
        ).paddingOnly(left: 10),
      ],
    ).paddingSymmetric(vertical: 8, horizontal: 16);
  }
}
