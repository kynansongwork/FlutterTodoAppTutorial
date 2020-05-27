import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_todos/blocs/filtered_todos/filtered_todos.dart';
import 'package:flutter_todos/blocs/todos/todos.dart';
import 'package:flutter_todos/models/models.dart';

// Responisble for dealing with state changes in the TodosBloc.
// It will maintain the state of filtered todos.
// It has a dependency on the TodosBloc.

