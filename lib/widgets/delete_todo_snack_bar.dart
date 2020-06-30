import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:flutter_todos/models/models.dart';

class DeleteTodoSnackBar extends SnackBar {
  final ArchSampleLocalizations localisations;

  DeleteTodoSnackBar({
    Key key,
    @required Todo todo,
    @required VoidCallback onUndo,
    @required this.localisations,
  }) : super(
          key: key,
          content: Text(
            localisations.todoDeleted(todo.task),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: localisations.undo,
            onPressed: onUndo,
          ),
  );
}