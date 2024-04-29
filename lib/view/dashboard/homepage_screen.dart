import 'package:flutter/material.dart';
import 'package:sipp_mobile/component/other/responsive_layout.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/constant/textstyles.dart';
import 'package:sipp_mobile/enums/button_style.dart';
import 'package:sipp_mobile/util/app_navigation.dart';
import 'package:sipp_mobile/view/dashboard/widget/header_widget.dart';
import 'package:sipp_mobile/view/dashboard/widget/menu_widget.dart';
import 'package:sipp_mobile/view/detector/detector_screen.dart';
import 'package:sipp_mobile/view/research/research_list_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),
            const SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Penelitianku", style: AppTextStyle.bold14Black,),
                  const SizedBox(height: 16,),
                  Visibility(
                    visible: ResponsiveLayout.isTablet(context) || ResponsiveLayout.isDesktop(context),
                      replacement: Column(
                        children: [
                          MenuWidget(
                              title: "Penelitian Lapangan",
                              titleStyle: AppTextStyle.bold14Purple,
                              subtitle: "Daftar hasil dari penelitian lapangan,\nbisa diakses siapapun!",
                              buttonText: "Periksa",
                              buttonAction: () {
                                AppNavigation.instance.push(page: const ResearchListScreen());
                              },
                              backgroundColor: AppColor.purpleTransparent,
                              buttonColor: AppButtonStyle.purpleFilled
                          ),
                          const SizedBox(height: 24,),
                          MenuWidget(
                              title: "Program Deteksi Objek",
                              titleStyle: AppTextStyle.bold14DeepBlue,
                              subtitle: "Coba fitur untuk mendeteksi objek sekarang juga!",
                              buttonText: "Mulai Deteksi",
                              buttonAction: () {
                                AppNavigation.instance.push(page: const DetectorScreen());
                              },
                              backgroundColor: AppColor.deepBlue.withOpacity(0.2),
                              buttonColor: AppButtonStyle.deepBlueFilled
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          MenuWidget(
                              title: "Penelitian Lapangan",
                              titleStyle: AppTextStyle.bold14Purple,
                              subtitle: "Daftar hasil dari penelitian lapangan,\nbisa diakses siapapun!",
                              buttonText: "Periksa",
                              buttonAction: () {
                                AppNavigation.instance.push(page: const ResearchListScreen());
                              },
                              backgroundColor: AppColor.purpleTransparent,
                              buttonColor: AppButtonStyle.purpleFilled
                          ),
                          const SizedBox(width: 24,),
                          MenuWidget(
                              title: "Program Deteksi Objek",
                              titleStyle: AppTextStyle.bold14DeepBlue,
                              subtitle: "Coba fitur untuk mendeteksi objek sekarang juga!",
                              buttonText: "Mulai Deteksi",
                              buttonAction: () {
                                AppNavigation.instance.push(page: const DetectorScreen());
                              },
                              backgroundColor: AppColor.deepBlue.withOpacity(0.2),
                              buttonColor: AppButtonStyle.deepBlueFilled
                          )
                        ],
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
