import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatefulWidget {
  final primary, elevatedtext;
  final void Function()? onPressed;

  const ElevatedButtonWidget(
      {Key? key,
      required this.onPressed,
      this.primary,
      required this.elevatedtext})
      : super(key: key);

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SizedBox(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(w * .40, h * .06), primary: widget.primary),
          onPressed: widget.onPressed,
          child: Text(widget.elevatedtext)),
    );
  }
}
