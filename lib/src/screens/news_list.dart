import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
      ),
      body: const Text('Show a list'),
    );
  }
}
