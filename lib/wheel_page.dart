import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinning_wheel/spin_wheel.dart';
import 'package:spinning_wheel/wheel_cubit.dart';

import 'add_item_dialog.dart';

class WheelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books Spinning Wheel'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: BlocBuilder<WheelCubit, List<String>>(
                builder: (context, state) {
                  return SpinWheel(items: state);
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AddItemDialog(),
                    );
                  },
                  tooltip: 'Add Item',
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: () {
                    context.read<WheelCubit>().spinWheel();
                  },
                  tooltip: 'Spin Wheel',
                  child: Icon(Icons.rotate_left),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}