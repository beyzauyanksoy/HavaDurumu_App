import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:showcaseview/showcaseview.dart';

import 'detail_page.dart';

class DetailShowCase extends StatelessWidget {
  const DetailShowCase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowCaseWidget(
        builder: Builder(builder: (context) => DetailPage()),
      ),
    );
  }
}
