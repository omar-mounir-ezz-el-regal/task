import 'package:flutter/material.dart';
import 'package:task/styles/colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  final controller, hintText, secure, suffixIcon;
  final String? Function(String?)? validate;
  final void Function()? suffixPressed;

  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.secure,
    this.suffixIcon,
    this.validate,
    this.suffixPressed,
  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SizedBox(
      width: w * .8,
      child: TextFormField(
        obscureText: widget.secure,
        controller: widget.controller,
        validator: widget.validate,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: widget.suffixPressed,
              icon: Icon(
                widget.suffixIcon,
                color: AppColor.grey2,
              )),
          hintText: widget.hintText,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          // focusedBorder: ,
          hintStyle: TextStyle(
            color: AppColor.grey3,
          ),
          fillColor: AppColor.grey4,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.grey2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.grey2)),
        ),
      ),
    );
  }
}
