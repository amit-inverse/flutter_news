import 'dart:async';
import 'package:flutter/material.dart';
import '../models/item_model.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel?>>? itemMap;
  final int depth;

  const Comment(
      {Key? key,
      required this.itemId,
      required this.itemMap,
      required this.depth})
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
            title: buildText(item!),
            subtitle:
                item.by == "" ? const Text('Deleted') : Text('${item.by}'),
            contentPadding: EdgeInsets.only(
              right: 16.0,
              left: (depth + 1) * 16.0,
            ),
          ),
          const Divider(),
        ];
        for (var kidId in snapshot.data!.kids!) {
          children.add(Comment(
            itemId: kidId,
            itemMap: itemMap,
            depth: depth + 1,
          ));
        }

        return Column(
          children: children,
        );
      },
    );
  }

  Widget buildText(ItemModel item) {
    final text = item.text!
        .replaceAll('&#x27;', "'")
        .replaceAll('&#x2F;', '/')
        .replaceAll('<p>', '\n\n')
        .replaceAll('</p>', '');

    return Text(text);
  }
}
