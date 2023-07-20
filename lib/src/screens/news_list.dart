import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    // THIS IS BAD!!! TEMPORARY
    bloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Text('Waiting...');
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, int index) {
            return Text(snapshot.data![index] as String);
          },
        );
      },
    );
  }
}
