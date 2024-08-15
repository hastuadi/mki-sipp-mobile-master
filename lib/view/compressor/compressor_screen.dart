import 'dart:typed_data';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/injector.dart';
import 'package:sipp_mobile/provider/detector/detector_provider.dart';
import 'package:sipp_mobile/provider/image_compressor/image_compressor_provider.dart';
import 'package:sipp_mobile/repository/detector/detector_repo.dart';
import 'package:sipp_mobile/view/compressor/widget/compressor_option.dart';
import 'package:sipp_mobile/view/compressor/widget/compressor_result.dart';
import 'package:sipp_mobile/view/compressor/widget/frame_image_compressor.dart';

import '../../component/button/base_button.dart';
import '../../constant/textstyles.dart';
import '../../enums/button_style.dart';

class ImageCompressorScreen extends StatelessWidget {
  const ImageCompressorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ImageCompressorProvider(),
      child: const ImageCompressorBody(),
    );
  }
}


class ImageCompressorBody extends StatefulWidget {
  const ImageCompressorBody({super.key});

  @override
  State<ImageCompressorBody> createState() => _ImageCompressorBodyState();
}

class _ImageCompressorBodyState extends State<ImageCompressorBody> {

  @override
  void initState() {
    // TODO: implement initState
    FirebaseAnalytics.instance.logEvent(name: "Compressor_Screen");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text("Kompres Gambar", style: AppTextStyle.bold14),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 7,
                          spreadRadius: 5,
                          offset: const Offset(0, 3)
                      )
                    ]
                ),
                width: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text("Upload Gambar", style: AppTextStyle.bold24Black),
                          const SizedBox(height: 8,),
                          Text("JPG, GIF, dan PNG tipe data yang diterima", style: AppTextStyle.regular12Black,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16,),
                    const FrameImageCompressor(),
                    const CompressorOption(),
                    const SizedBox(height: 16,),
                    const CompressorResult(),
                    const SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Consumer<ImageCompressorProvider>(
                            builder: (context, provider, child) => BaseButton(
                              onPressed: provider.imagePath != null ? () {
                                provider.reset();
                              } : null,
                              buttonStyle: AppButtonStyle.redFilled,
                              child: Text("Ulangi", style: AppTextStyle.regular14White,),
                            ),
                          ),
                        ),
                        const SizedBox(width: 24,),
                        Expanded(
                          child: Consumer<ImageCompressorProvider>(
                            builder: (context, provider, child) => BaseButton(
                              onPressed: provider.imagePath != null && provider.compressedImage == null ? () async {
                                FirebaseAnalytics.instance.logEvent(name: "Compress_Success");
                                EasyLoading.show();
                                await provider.compress(provider.imagePath!);
                                EasyLoading.dismiss();
                              } : null,
                              buttonStyle: AppButtonStyle.greenFilled,
                              child: Text("Kompres Gambar", style: AppTextStyle.regular14White,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
