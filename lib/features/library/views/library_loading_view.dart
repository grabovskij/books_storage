import 'package:flutter/material.dart';

class LibraryLoadingView extends StatelessWidget {
  const LibraryLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RepaintBoundary(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
