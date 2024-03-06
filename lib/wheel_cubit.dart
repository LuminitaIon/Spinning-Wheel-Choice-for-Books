import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinning_wheel/result_dialog.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class WheelCubit extends Cubit<List<String>> {
  WheelCubit() : super([]);

  void addItem(String item) {
    List<String> currentState = List.from(state);
    currentState.add(item);
    emit(currentState);
  }

  void spinWheel() {
    final random = Random();
    if (state.isNotEmpty) {
      final int randomIndex = random.nextInt(state.length);
      final String result = state[randomIndex];
      emit(state.where((item) => item != result).toList());
      showDialog(
        context: navigatorKey.currentState!.context,
        builder: (_) => ResultDialog(result: result),
      );
    }
  }
}
