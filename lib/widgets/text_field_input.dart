import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFieldInput extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final TextInputType textInputType;
  final String hintText;
  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.textInputType,
      required this.hintText})
      : super(key: key);

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: widget.textInputType,
      obscureText: widget.isPass,
    );
  }
}
