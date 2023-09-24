import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController fieldController;
  final TextInputType keyboardType;
  final String hintText;
  final double top;
  final IconData suffixIcon;

  const CustomTextFormField({
    super.key,
    required this.fieldController,
    required this.hintText,
    required this.keyboardType,
    required this.top,
    required this.suffixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;
  Widget? icon;

  @override
  Widget build(BuildContext context) {
    if (widget.suffixIcon == Icons.visibility) {
      icon = IconButton(
        icon: Icon(
          _obscureText == true ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
        onPressed: () {
          setState(() {
            _obscureText == true ? _obscureText = false : _obscureText = true;
          });
        },
      );
    } else if (widget.suffixIcon == Icons.abc) {
      icon = Icon(
        widget.suffixIcon,
        color: Colors.white,
      );
      _obscureText = false;
    } else {
      icon = Icon(widget.suffixIcon, color: Colors.grey);
      _obscureText = false;
    }
    return Padding(
        padding: EdgeInsets.only(top: widget.top),
        child: TextFormField(
          controller: widget.fieldController,
          style: TextStyle(fontSize: 16),
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 179, 179, 179),
            ),
            contentPadding: EdgeInsets.all(15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  style: BorderStyle.none,
                  width: 0,
                )),
            suffixIcon: icon,
            filled: true,
            fillColor: Colors.white,
          ),
        ));
  }
}
