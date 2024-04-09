import 'package:flutter/material.dart';

const Color background = Color(0xffB8D8E5);
const Color secondaryColor = Color(0xff54538E);
TextStyle myAppBarTextStyle =
    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

ButtonStyle myButtonStyle = ButtonStyle(
  textStyle: MaterialStateProperty.all<TextStyle>(
      const TextStyle(color: Colors.white, fontSize: 18.0)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)))),
  backgroundColor: MaterialStateProperty.all(secondaryColor),
);

ButtonStyle myUnSelectedOption = ButtonStyle(
  minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 60)),
  side: MaterialStateProperty.all<BorderSide>(
    const BorderSide(color: Color(0xff00B5FF), width: 2),
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(
    const Color.fromARGB(0, 44, 186, 242),
  ),
);

ButtonStyle mySelectedOption = myUnSelectedOption.copyWith(
  backgroundColor: MaterialStateProperty.all<Color>(
    const Color(0xff00B5FF),
  ),
);

TextStyle myUnSelectedOptionText =
    const TextStyle(color: Colors.black, fontSize: 16.0);

TextStyle mySelectedOptionText =
    myUnSelectedOptionText.copyWith(color: Colors.white);

TextStyle testTextStyle = const TextStyle(color: Color(0xff6F6F6F));
