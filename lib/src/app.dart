import 'package:flutter/material.dart';
import './screens/news_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'News',
      home: NewsList(),
    );
  }
}