import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:medic/models/suggestion.dart';
import 'package:flutter/material.dart';

abstract class SuggestionEvent {}

class SuggestEvent extends SuggestionEvent {}

enum ProductAction { getOne, increment, decrement, save, delete }

class SuggestionBloc {
  final sugestion = suggestionData;
  List cartItems = [];

  final _suggestionStateController = StreamController<List>();
  StreamSink<List> get suggestionSink => _suggestionStateController.sink;
  Stream<List> get suggestionStream => _suggestionStateController.stream;

  final _suggestionEventController = StreamController<ProductAction>();
  StreamSink<ProductAction> get suggestionEventSink =>
      _suggestionEventController.sink;
  Stream<ProductAction> get suggestionEventStream =>
      _suggestionEventController.stream;

  SuggestionBloc() {
    suggestionEventStream.listen((event) {
      if (event == ProductAction.getOne) {
        sugestion.firstWhere((element) => element.id);
      }
    });
  }
}
