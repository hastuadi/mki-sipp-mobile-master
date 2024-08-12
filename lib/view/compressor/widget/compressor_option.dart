import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/component/other/responsive_layout.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/constant/textstyles.dart';

import '../../../provider/image_compressor/image_compressor_provider.dart';

class CompressorOption extends StatelessWidget {
  const CompressorOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ImageCompressorProvider, Uint8List?>(
      selector: (context, provider) => provider.imagePath,
      builder: (context, image, child) {
        return Visibility(
            visible: image != null && image.lengthInBytes > 3000000,
            child: child!
        );
      },
      child: Column(
        children: [
          const SizedBox(height: 16,),
          Visibility(
            visible: ResponsiveLayout.isDesktop(context) || ResponsiveLayout.isTablet(context),
            replacement: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Ukuran Original : ${((context.watch<ImageCompressorProvider>().imagePath?.lengthInBytes ?? 0) / 1000000).toStringAsFixed(2)} MB"),
                const SizedBox(height: 16,),
                Wrap(
                  spacing: 5.0,
                  children: List<Widget>.generate(
                    3, (int index) {
                    return Consumer<ImageCompressorProvider>(
                      builder: (context, provider, child) => ChoiceChip(
                        labelStyle: AppTextStyle.regular14Green,
                        label: Text("${provider.sizeChoice[index].toString()} MB"),
                        checkmarkColor: AppColor.greenColor,
                        backgroundColor: Colors.white,
                        selectedColor: AppColor.greenColor.withOpacity(0.2),
                        showCheckmark: provider.chooseSizeIndex == index,
                        selected: provider.chooseSizeIndex == index,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          provider.chooseSize(index);
                        },
                      ),
                    );
                  },
                  ).toList(),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ukuran Original : ${((context.watch<ImageCompressorProvider>().imagePath?.lengthInBytes ?? 0) / 1000000).toStringAsFixed(2)} MB"),
                Wrap(
                  spacing: 5.0,
                  children: List<Widget>.generate(
                    3, (int index) {
                    return Consumer<ImageCompressorProvider>(
                      builder: (context, provider, child) => ChoiceChip(
                        labelStyle: AppTextStyle.regular14Green,
                        label: Text("${provider.sizeChoice[index].toString()} MB"),
                        checkmarkColor: AppColor.greenColor,
                        backgroundColor: Colors.white,
                        selectedColor: AppColor.greenColor.withOpacity(0.2),
                        showCheckmark: provider.chooseSizeIndex == index,
                        selected: provider.chooseSizeIndex == index,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          provider.chooseSize(index);
                        },
                      ),
                    );
                  },
                  ).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
