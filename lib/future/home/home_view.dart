import 'package:flutter/material.dart';
import 'package:flutter_base_start/product/constant/app_laucnhurl.dart'
    show AppLaunchUrl;
import 'package:flutter_base_start/product/service/service_locator.dart';
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
      appBar: AppBar(
        title: const Text('Home View'),
      ),
      body: Center(
        child: Column(
          spacing: 20,
          children: [
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
            ElevatedButton(
              onPressed: () async {
                await locator.urlLauncherService.launchUrlInBrowser(
                  url: AppLaunchUrl.website,
                );
              },
              child: const Text(AppLaunchUrl.website),
            ),
          ],
        ),
      ),
    );
  }
}
