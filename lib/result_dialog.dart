import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final String result;

  const ResultDialog({required this.result});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Spin Result'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('You got:'),
          SizedBox(width: 4,),
          Text(
            '$result',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
