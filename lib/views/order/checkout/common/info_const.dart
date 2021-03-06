import 'package:flutter/material.dart';


class InfoConst extends StatelessWidget {

  final String title;
  final String info;
  final IconData icon;

  const InfoConst({
    @required this.title,
    @required this.info,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: avoid_redundant_argument_values
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17
          ),
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}