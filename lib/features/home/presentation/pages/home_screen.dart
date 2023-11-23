import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../component/stay_organized_component/stay_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(67),
                  child: SvgPicture.asset(
                    'assets/homeScreenicon.svg',
                    semanticsLabel: 'Thanks',
                  ),
                ),
              ),
            ),
            StayOrganizedComponent(),
          ],
        ),
      ),
    );
  }
}
