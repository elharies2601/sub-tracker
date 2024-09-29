import 'package:flutter/foundation.dart';

@immutable
abstract class UiState {}

class InitialState extends UiState {}

class LoadingState extends UiState {}

class SuccessState<T> extends UiState {
  final T data;
  SuccessState(this.data);
}

class ErrorState extends UiState {
  final String msg;
  ErrorState(this.msg);
}
