import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:weatherapp/home_page.dart';

class HomeShowCase extends StatelessWidget {
  const HomeShowCase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowCaseWidget(
        builder: Builder(builder: (context) => HomePage()),
      ),
    );
  }
}
