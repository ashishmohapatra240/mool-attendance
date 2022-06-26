import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPass;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.isPass})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

bool passwordVisible = true;

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode _focusNode = new FocusNode();

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      onTap: _requestFocus,
      controller: widget.controller,
      obscureText: widget.isPass && passwordVisible,
      decoration: InputDecoration(
        label: Text(
          widget.hintText,
          style: TextStyle(
            color: _focusNode.hasFocus ? Color(0xff405cd2) : Color(0xffDCDFE8),
            // TextStyle(color: Color(0xffC1C1C1)),
          ),
        ),
        labelStyle: TextStyle(
          color: _focusNode.hasFocus ? Color(0xff405cd2) : Color(0xffDCDFE8),
        ),
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        hintStyle: const TextStyle(
          color: Color(0xffC1C1C1),
          fontSize: 14.0,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffDCDFE8),
          ),
        ),
        suffixIcon: ((widget.isPass)
            ? IconButton(
                icon: Icon(
                  !passwordVisible ? Icons.visibility_off : Icons.visibility,
                  color: Color(0xffC1C1C1),
                ),
                onPressed: () {
                  setState(
                    () {
                      passwordVisible = !passwordVisible;
                    },
                  );
                },
              )
            : null),
      ),
    );
  }
}
