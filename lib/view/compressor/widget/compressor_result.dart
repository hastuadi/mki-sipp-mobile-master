import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/constant/app_constant.dart';
import 'package:sipp_mobile/enums/button_style.dart';
import 'package:sipp_mobile/provider/image_compressor/image_compressor_provider.dart';

import '../../../component/button/base_button.dart';
import '../../../constant/textstyles.dart';
import '../../../util/app_navigation.dart';

class CompressorResult extends StatelessWidget {
  const CompressorResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ImageCompressorProvider, Uint8List?>(
      selector: (p0, provider) => provider.compressedImage,
      builder: (context, image, child) => Visibility(visible: image != null, child: child!),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                  color: Colors.black.withOpacity(0.3),
                  width: 2,
                  style: BorderStyle.solid
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Selector<ImageCompressorProvider, Uint8List?>(
                  selector: (_, provider) => provider.compressedImage,
                  builder:(_, image, child) => Text("Kompres Berhasil! (${((image?.lengthInBytes ?? 0) / 1000000).toStringAsFixed(2)} MB)",
                    style: AppTextStyle.regular14Black,),
                ),
                SizedBox(
                  height: 45,
                  width: 150,
                  child: BaseButton(
                      buttonStyle: AppButtonStyle.greenFilled,
                      onPressed: () {
                        ImageCompressorProvider provider = context.read<ImageCompressorProvider>();
                        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                          FirebaseAnalytics.instance.logEvent(name: "Use_Image_Result");
                          EasyLoading.show();
                          await Future.delayed(const Duration(seconds: 1));
                          EasyLoading.dismiss();
                          AppNavigation.instance.push(path: AppConstant.researchDetectRoute, extra: provider.compressedImage);
                        });
                      },
                      child: Text("Deteksi Gambar", style: AppTextStyle.regular12White,)
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
