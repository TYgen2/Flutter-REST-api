import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:todo_restapi/utils/delete_alert.dart';

class TodoCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final Function(String) deleteByID;
  const TodoCard({
    super.key,
    required this.index,
    required this.item,
    required this.navigateEdit,
    required this.deleteByID,
  });

  @override
  Widget build(BuildContext context) {
    final id = item['_id'] as String;
    return Dismissible(
      key: Key(item['title']),
      background: Container(
        padding: const EdgeInsets.only(left: 28),
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.delete),
      ),
      direction: DismissDirection.startToEnd,
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          bool? delete = await showDeleteConfirmDialog(context);
          if (delete == true) {
            // delete and remove item
            deleteByID(id);
            if (!context.mounted) return;
            showDeleteSuccess(context);
          }
        }
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(child: Text('${index + 1}')),
          title: Text(item['title']),
          subtitle: Text(item['description']),
          trailing: PopupMenuButton(
            onSelected: (value) async {
              if (value == 'edit') {
                // open edit page
                navigateEdit(item);
              } else if (value == 'delete') {
                bool? delete = await showDeleteConfirmDialog(context);

                if (delete == true) {
                  // delete and remove item
                  deleteByID(id);
                  if (!context.mounted) return;
                  showDeleteSuccess(context);
                } else {
                  return;
                }
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ];
            },
          ),
        ),
      ),
    );
  }
}
