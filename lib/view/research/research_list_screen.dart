import 'package:flutter/material.dart';
import 'package:sipp_mobile/util/app_navigation.dart';
import 'package:sipp_mobile/view/research/research_location_screen.dart';

import '../../constant/textstyles.dart';

class ResearchListScreen extends StatelessWidget {
  const ResearchListScreen({Key? key}) : super(key: key);

  static const List<String> researches = [
    "Deteksi Objek",
  ];

  static const List<Widget> actions = [
    ResearchLocationScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        title: Text("Kategori Penelitian", style: AppTextStyle.bold14),
      ),
      body: ListView.separated(
          itemCount: researches.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                AppNavigation.instance.push(page: actions[index]);
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  researches[index],
                  style: AppTextStyle.regular12Black,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(),
          ),),
    );
  }
}
