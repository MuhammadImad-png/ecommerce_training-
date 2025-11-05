import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
  }

  @override
  void onClose(BlocBase bloc) {
    log(bloc.toString());
  }

  @override
  void onCreate(BlocBase bloc) {
    log(bloc.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log("Error: $error", stackTrace: stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log("Event: $event");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Transition: $transition");
  }
}
