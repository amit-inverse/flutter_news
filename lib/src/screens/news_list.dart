import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(context) {
    final bloc = StoriesProvider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
      ),
      body: const Text('Show a list'),
    );
  }
}
