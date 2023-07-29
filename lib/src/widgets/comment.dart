import 'dart:async';
import 'package:flutter/material.dart';
import '../models/item_model.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel?>>? itemMap;

  const Comment({Key? key, required this.itemId, required this.itemMap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ItemModel?>(
      future: itemMap![itemId],
      builder: (context, AsyncSnapshot<ItemModel?> snapshot) {
        if (!snapshot.hasData) {
          return const Text('Still loading comment');
        }

        final item = snapshot.data;
        final children = <Widget>[
          ListTile(
            title: Text('${item!.text}'),
            subtitle:
                item.by == "" ? const Text('Deleted') : Text('${item.by}'),
          ),
          const Divider(),
        ];
        for (var kidId in snapshot.data!.kids!) {
          children.add(Comment(
            itemId: kidId,
            itemMap: itemMap,
          ));
        }

        return Column(
          children: children,
        );
      },
    );
  }
}
