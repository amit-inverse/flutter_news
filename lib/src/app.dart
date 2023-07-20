import 'package:flutter/material.dart';
import './screens/news_list.dart';
import './blocs/stories_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return StoriesProvider(
      child: const MaterialApp(
        title: 'News',
        home: NewsList(),
      ),
    );
  }
}
