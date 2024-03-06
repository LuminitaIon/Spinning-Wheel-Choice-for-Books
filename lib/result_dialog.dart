import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final String result;

  const ResultDialog({required this.result});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Spin Result',
        style: TextStyle(color: Colors.grey),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'You got:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '$result',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Container(
            // color: Colors.blue,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(13),
              color: Colors.blue.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 8.0,
                bottom: 8.0,
              ),
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
