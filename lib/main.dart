import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinning_wheel/wheel_cubit.dart';
import 'package:spinning_wheel/wheel_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WheelCubit>(
          create: (BuildContext context) => WheelCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Spinning Wheel App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorKey: navigatorKey,
        home: WheelPage(),
      ),
    );
  }
}


