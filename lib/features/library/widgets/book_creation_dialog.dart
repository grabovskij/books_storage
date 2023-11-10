import 'package:books_storage/core/extensions/widget_padding_extension.dart';
import 'package:books_storage/features/library/controllers/book_manager.dart';
import 'package:flutter/material.dart';

class BookCreationDialog extends StatelessWidget {
  final BookManager bookManager = BookManager();

  BookCreationDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Название'),
          TextField(onChanged: bookManager.setTitle),
          const Text('Автор'),
          TextField(onChanged: bookManager.setAuthor),
          const Text('Год'),
          TextField(onChanged: bookManager.setYear),
          const Text('Издательство'),
          TextField(onChanged: bookManager.setPublisher),
          const Text('Страниц'),
          TextField(onChanged: bookManager.setPagesNumber),
          Center(
            child: FilledButton(
              child: const Text('Сохранить'),
              onPressed: () async {
                final navigator = Navigator.of(context);
                final book = bookManager.bookStream.last;

                bookManager.cancel();
                navigator.pop(await book);
              },
            ),
          ),
        ],
      ).paddingAll(16),
    );
  }
}
