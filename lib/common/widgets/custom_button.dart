import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(double.infinity, 50),
        shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))
      ),
    );
  }
}
