import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:medic/models/categories.dart';
import 'package:flutter/material.dart';

abstract class CategoriesEvent {}

class CategoryEvent extends CategoriesEvent {}

class CategoryBloc {
  final category = categoriesList;
  // final category = 0;


  final _categoryStateController = StreamController<List>();
  StreamSink<List> get categorySink => _categoryStateController.sink;

  Stream<List> get categoryStream => _categoryStateController.stream;
}
