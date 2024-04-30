import 'package:flutter/material.dart';
import 'package:sipp_mobile/component/button/base_button.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/enums/button_style.dart';

import '../../../constant/textstyles.dart';

class RegionField extends StatelessWidget {
  const RegionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(5)
              ),
              child: const Icon(Icons.remove, size: 16, color: Colors.white,)
          ),
        ),
        const SizedBox(width: 8,),
        Container(
          height: 24,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey
            )
          ),
        ),
        const SizedBox(width: 8,),
        InkWell(
          onTap: () {},
          child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: const Icon(Icons.add, size: 16, color: Colors.white,)
          ),
        ),
      ],
    );
  }
}
