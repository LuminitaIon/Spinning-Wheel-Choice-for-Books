import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinning_wheel/spin_wheel.dart';
import 'package:spinning_wheel/wheel_cubit.dart';

import 'add_item_dialog.dart';

class WheelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffe3e3),
      appBar: AppBar(
        backgroundColor: Color(0xffffe3e3),
        title: Text(
          'Books Spinning Wheel',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: BlocBuilder<WheelCubit, List<String>>(
                builder: (context, state) {
                  if (state.isEmpty) {
                    return Center(
                      child: Text(
                        'Add items to spin the wheel',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  } else {
                    return SpinWheel(
                      items: state,
                      colors: List.generate(
                        state.length,
                        (index) =>
                            Colors.primaries[index % Colors.primaries.length],
                      ),
                      backgroundColor: Colors.grey,
                    );
                  }
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
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
                    SizedBox(height: 8),
                    Text('Add Item'),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        context.read<WheelCubit>().spinWheel();
                      },
                      tooltip: 'Spin Wheel',
                      child: Icon(Icons.rotate_left),
                    ),
                    SizedBox(height: 8),
                    Text('Spin the Wheel')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
