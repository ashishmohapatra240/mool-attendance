import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPass;
  var errText;
  CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.isPass,
      required this.errText})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

bool buttonVisible = false;
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return TextFormField(
      focusNode: _focusNode,
      onTap: () {
        _requestFocus();
        if (widget.errText() != null)
          setState(() {
            widget.errText = () {};
          });
      },
      onEditingComplete: () {
        _requestFocus();
        if (widget.errText() != null)
          setState(() {
            widget.errText = () {};
          });
      },
      onChanged: (_) {
        setState(
          () {
            if (widget.errText() != null) widget.errText = () {};
            buttonVisible = widget.controller.text.length > 0;
          },
        );
      },
      controller: widget.controller,
      // validator: (_) {
      //   print("step 0========");
      //   return widget.errText();
      // },
      obscureText: widget.isPass && passwordVisible,
      decoration: InputDecoration(
        errorText: widget.errText(),
        label: Text(
          widget.hintText,
          style: TextStyle(
            color: widget.errText() == null
                ? (_focusNode.hasFocus ? Color(0xff405cd2) : Color(0xffDCDFE8))
                : Colors.red,
            // TextStyle(color: Color(0xffC1C1C1)),
          ),
        ),
        labelStyle: TextStyle(
          color: widget.errText() == null
              ? (_focusNode.hasFocus ? Color(0xff405cd2) : Color(0xffDCDFE8))
              : Colors.red,
        ),
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        hintStyle: const TextStyle(
          color: Color(0xffC1C1C1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffDCDFE8),
          ),
        ),
        suffixIcon: ((widget.isPass & buttonVisible)
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
