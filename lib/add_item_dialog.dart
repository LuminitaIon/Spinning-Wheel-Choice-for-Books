import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinning_wheel/wheel_cubit.dart';

class AddItemDialog extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Item'),
      content: TextField(
        controller: _textController,
        decoration: InputDecoration(hintText: 'Enter item name'),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final String newItem = _textController.text.trim();
            if (newItem.isNotEmpty) {
              context.read<WheelCubit>().addItem(newItem);
              Navigator.of(context).pop();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}