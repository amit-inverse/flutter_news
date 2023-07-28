import 'package:flutter/material.dart';
import './blocs/stories_provider.dart';
import './screens/news_detail.dart';
import './screens/news_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News',
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          return const NewsList();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          final itemId = int.parse(settings.name!.replaceFirst('/', ''));
          return NewsDetail(
            itemId: itemId,
          );
        },
      );
    }
  }
}
