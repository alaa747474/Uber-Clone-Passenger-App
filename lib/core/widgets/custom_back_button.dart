import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BackButton(
      
      onPressed: () => Navigator.pop(context),
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(10),
          shadowColor: const MaterialStatePropertyAll(Colors.black26),
          foregroundColor:
              MaterialStatePropertyAll(Theme.of(context).primaryColor),
          backgroundColor:
              MaterialStatePropertyAll(Theme.of(context).cardColor)),
    );
  }
}
