import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomSelect extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyBoardType;
  final bool isPassword;

  const CustomSelect(
      {super.key,
      required this.icon,
      required this.placeholder,
      required this.textController,
      required this.keyBoardType,
      required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 5),
              blurRadius: 5,
            )
          ]),
      child: Column(
        children: <Widget>[
          RadioListTile(
            title: const Text('Lafayette'),
            value: 'lafayette',
            groupValue: '_character',
            onChanged: (value) {},
          ),
          RadioListTile(
            title: const Text('Thomas Jefferson'),
            value: 'jefferson',
            groupValue: '_character',
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
/**
 * SelectFormField(
  type: SelectFormFieldType.dropdown, // or can be dialog
  initialValue: 'circle',
  icon: Icon(Icons.format_shapes),
  labelText: 'Shape',
  items: _items,
  onChanged: (val) => print(val),
  onSaved: (val) => print(val),
)
 */