import 'package:books_storage/core/extensions/widget_padding_extension.dart';
import 'package:books_storage/domain/models/book_info.dart';
import 'package:books_storage/features/library/controllers/library_manager/library_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        const Spacer(),
        IconButton(
          onPressed: () {
            context.read<LibraryManager>().remove(bookInfo.id!);
          },
          icon: const Icon(Icons.delete),
        )
      ],
    ).paddingSymmetric(vertical: 8, horizontal: 16);
  }
}
