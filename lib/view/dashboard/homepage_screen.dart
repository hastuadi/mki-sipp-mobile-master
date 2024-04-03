import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sipp_mobile/component/button/base_button.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/constant/textstyles.dart';
import 'package:sipp_mobile/enums/button_style.dart';
import 'package:sipp_mobile/util/app_navigation.dart';
import 'package:sipp_mobile/view/dashboard/widget/header_widget.dart';
import 'package:sipp_mobile/view/research/research_list.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EasyLoading.show();
    Timer(const Duration(seconds: 3), () {
      EasyLoading.dismiss();
    });
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
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColor.purpleTransparent,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Penelitian Lapangan", style: AppTextStyle.bold14Purple,),
                              const SizedBox(height: 8,),
                              Text("Daftar hasil dari penelitian lapangan,\nbisa diakses siapapun!", style: AppTextStyle.regular12Black,),
                              const SizedBox(height: 14,),
                              BaseButton(
                                  buttonStyle: AppButtonStyle.purpleFilled,
                                  onPressed: () {
                                    AppNavigation.instance.push(page: const ResearchListScreen());
                                  },
                                  child: Text("Periksa", style: AppTextStyle.regular12White,)
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
