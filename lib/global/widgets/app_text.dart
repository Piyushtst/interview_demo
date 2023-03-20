import 'package:flutter/material.dart';


class AppText extends StatelessWidget {
  final String text;
  Color? txtColor;
  double? size;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  String? fontFamily;
  TextAlign? txtAlign;
  TextOverflow? textOverflow;
  int? maxLine;

  AppText({
    Key? key,
    required this.text,
    this.txtColor,
    this.size,
    this.fontWeight,
    this.txtAlign,
    this.maxLine,
    this.textOverflow,
    this.fontStyle,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        maxLines: maxLine ?? 2,
        style: TextStyle(
          fontFamily: fontFamily,
          fontStyle: fontStyle,
          color: txtColor ?? Colors.black,
          fontSize: size ?? 8,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
        textAlign: txtAlign); //getternsleted(context,key)
  }
}





class AppRitchText extends StatelessWidget {
  final String text;
  final String text2;
  Color? txtColor;
  double? size;
  FontStyle? fontStyle;
  String? fontFamily;
  TextAlign? txtAlign;
  TextOverflow? textOverflow;
  int? maxLine;
  AppRitchText({
    Key? key,
    required this.text,
    this.txtColor,
    this.size,

    this.txtAlign,
    this.maxLine,
    this.textOverflow,
    this.fontStyle,
    required this.text2,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
        children: <TextSpan>[
          TextSpan(text:  text,style: const TextStyle(
            color: Colors.black87,
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),),
          TextSpan(text: text2, style: const TextStyle(
            color: Colors.green,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),),

        ],
      ),
    ); //getternsleted(context,key)
  }
}








