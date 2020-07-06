import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomFormField extends StatelessWidget {

  final FocusNode focusNode;
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final TextInputAction textInputAction;
  final TextInputType keyBoardType;
  final IconData iconData;
  final bool obscureText;
  final VoidCallback setObscure;
  final List<TextInputFormatter> inputformatters;
  final bool enabled;

  const CustomFormField(
    {
      @required this.focusNode,
      @required this.onChanged,
      @required this.hintText,
      @required this.onFieldSubmitted,
      @required this.textInputAction,
      @required this.keyBoardType,
      @required this.iconData,
      @required this.enabled,
      this.obscureText,
      this.setObscure,
      this.inputformatters,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color.fromARGB(100, 255, 255, 255)
      ),
      child: TextFormField(
        enabled: enabled,
        focusNode: focusNode,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction,
        keyboardType: keyBoardType,
        obscureText: false,
        style: TextStyle(
          color: Colors.black
        ),
        cursorColor: Colors.white,
        inputFormatters: inputformatters ?? [],
        decoration: InputDecoration(
          icon: Icon(
            iconData,
            color: const Color.fromARGB(255, 255, 153, 51),
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0).withAlpha(70),
            fontFamily: 'Nunito'
          ),
        ),
      ),
    );
  }
}