import 'package:flutter/material.dart';
import 'package:news_demo/global/widgets/app_text.dart';

class AppButton extends StatefulWidget {
  final String btnText;
  Function? onTap;
  Color? bttxtColor;
  Color? bgColor;
  double? width;
  double? height;

  AppButton(
      {Key? key,
        required this.btnText,
        this.onTap,
        this.bttxtColor,
        this.width,
        this.height,
        this.bgColor})
      : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color:  widget.bgColor ?? Colors.indigoAccent,
            borderRadius: BorderRadius.circular(16)),
        height: 48,
        width: widget.width ?? double.infinity,
        child: Center(
            child: FittedBox(
              child: AppText(
                text: widget.btnText,
                size: 16,
                txtColor: Colors.white,
                 fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontFamily: '',
              ),
            )),
      ),
    );
  }
}














