import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinning_wheel/result_dialog.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class WheelCubit extends Cubit<List<String>> {
  late AnimationController _controller;
  WheelCubit() : super([]);

  void addItem(String newItem) {
    emit([...state, newItem]);
  }

  void initAnimation(TickerProvider vsync) {
    _controller = AnimationController(
      vsync: vsync,
      duration: Duration(seconds: 5),
    )..addListener(() {
      emit(state);
    });
  }

  void dispose() {
    _controller.dispose();
  }

  void removeResultFromWheel() {
    if (state.isNotEmpty) {
      emit(state.sublist(1));
    }
  }

  void spinWheel() {
    if (state.isNotEmpty) {
      _controller.forward(from: 0.0);
      Future.delayed(Duration(seconds: 5), () {
        // Simulating result display after 5 seconds
        removeResultFromWheel();
      });
    }
  }

  double get wheelAngle => _controller.value * 2 * pi;
}
