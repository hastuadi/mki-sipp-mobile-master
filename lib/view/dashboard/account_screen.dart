import 'package:flutter/material.dart';
import 'package:sipp_mobile/component/button/base_button.dart';
import 'package:sipp_mobile/component/input/base_input.dart';
import 'package:sipp_mobile/enums/button_style.dart';
import 'package:sipp_mobile/view/dashboard/widget/header_widget.dart';

import '../../constant/textstyles.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

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
                  Text("Data Pribadi", style: AppTextStyle.bold14Black,),
                  const SizedBox(height: 16,),
                  BaseInput(
                    enabled: false,
                      controller: TextEditingController(),
                      fillColor: Colors.grey.shade300,
                      hint: "Rafi Mochamad Fahreza"
                  ),
                  const SizedBox(height: 16,),
                  BaseInput(
                      enabled: false,
                      controller: TextEditingController(),
                      fillColor: Colors.grey.shade300,
                      hint: "rafimfahreza@rocketmail.com"
                  ),
                  const SizedBox(height: 24,),
                  BaseButton(
                      buttonStyle: AppButtonStyle.redFilled,
                      onPressed: (){},
                      child: Text("Keluar", style: AppTextStyle.regular12White,)
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
