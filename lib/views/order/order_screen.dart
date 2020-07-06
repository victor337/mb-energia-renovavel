import 'package:flutter/material.dart';
import 'package:mbenergiarenovavel/common/drawer/custom_drawer.dart';


class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(),
    );
  }
}