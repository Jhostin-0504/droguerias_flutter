import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyBoardType;
  final bool isPassword;

  const CustomInput(
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
      child: TextField(
        controller: this.textController,
        autocorrect: false,
        keyboardType: this.keyBoardType,
        obscureText: this.isPassword,
        decoration: InputDecoration(
            prefixIcon: Icon(this.icon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: this.placeholder),
      ),
    );
  }
}
