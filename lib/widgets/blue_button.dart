import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final Function() onPressed;
  final label;
  const BlueButton({Key? key, required this.onPressed, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 17),
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        elevation: 2,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
    );
  }
}
