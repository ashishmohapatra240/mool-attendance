import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPass;
  static bool errorVis = true;
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
        // errorVis = false;
        _requestFocus();
        // if (widget.errText() != null)
        //   setState(() {
        //     widget.errText = () {};
        //   });
      },
      onEditingComplete: () {
        _requestFocus();
        // if (widget.errText() != null)
        //   setState(() {
        //     widget.errText = () {};
        //   });
      },
      onChanged: (_) {
        setState(
          () {
            if (widget.errText() != null) CustomTextField.errorVis = false;
            // widget.errText = () {};
            buttonVisible = widget.controller.text.length > 0;
          },
        );
      },
      controller: widget.controller,
      obscureText: widget.isPass && passwordVisible,
      decoration: InputDecoration(
        errorText: CustomTextField.errorVis ? widget.errText() : null,
        label: Text(
          widget.hintText,
          style: TextStyle(
            color: (widget.errText() != null && CustomTextField.errorVis)
                ? Colors.red
                : (_focusNode.hasFocus ? Color(0xff405cd2) : Color(0xffDCDFE8)),
            // TextStyle(color: Color(0xffC1C1C1)),
          ),
        ),
        labelStyle: TextStyle(
          color: (widget.errText() != null && CustomTextField.errorVis)
              ? Colors.red
              : (_focusNode.hasFocus ? Color(0xff405cd2) : Color(0xffDCDFE8)),
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
