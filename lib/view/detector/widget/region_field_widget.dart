import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/provider/detector/detector_provider.dart';

import '../../../constant/textstyles.dart';

class RegionField extends StatelessWidget {
  const RegionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<DetectorProvider>(
          builder: (context, value, child) =>  InkWell(
            onTap: () {
              context.read<DetectorProvider>().adjustMaxRegion(increment: false);
            },
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
          child: Center(child: Selector<DetectorProvider, int>(
            selector: (p0, p1) => p1.maxRegion,
              builder: (context, value, child) =>  Text(value.toString(), style: AppTextStyle.regular12Black,))
          ),
        ),
        const SizedBox(width: 8,),
        Consumer<DetectorProvider>(
          builder: (context, value, child) => InkWell(
            onTap: () {
              context.read<DetectorProvider>().adjustMaxRegion(increment: true);
            },
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
        ),
      ],
    );
  }
}
