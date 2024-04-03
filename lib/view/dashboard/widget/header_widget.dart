import 'package:flutter/material.dart';

import '../../../constant/colors.dart';
import '../../../constant/textstyles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 290,
          child: Container(
            color: AppColor.primaryColor,
          ),
        ),
        Positioned(
          left: -100,
          top: -87,
          child: Image.asset('assets/images/general/white-round-bg-icon.png'),
        ),
        Positioned(
          bottom: 48,
          left: 22,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Selamat Datang", style: AppTextStyle.regular12White,),
              const SizedBox(height: 2,),
              Text("Rafi Mochamad Fahreza", style: AppTextStyle.bold18White,),
            ],
          ),
        )
      ],
    );
  }
}
