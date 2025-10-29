import 'package:flutter/material.dart';
import 'package:flutter_base_start/product/constant/app_padding.dart';
import 'package:gen/gen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Home View'),

          //Module Kıtüphanelerinden Örnekler
          Assets.lottie.premiumAnimation.lottie(
            height: 200,
            width: 200,
            package: 'gen',
          ),

          Assets.image.taslar.image(
            height: 200,
            width: 200,
            package: 'gen',
          ),

          Assets.svg.dance.svg(
            height: 200,
            width: 200,
            package: 'gen',
          ),

          Padding(
            padding: ProjectPadding.allSmall,
            child: Container(
              color: ColorName.red,
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
