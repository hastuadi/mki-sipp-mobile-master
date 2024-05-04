import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/provider/detector/detector_provider.dart';
import 'package:sipp_mobile/util/app_util.dart';

import '../../../component/other/responsive_layout.dart';
import '../../../constant/textstyles.dart';

class FrameImage extends StatelessWidget {
  const FrameImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: Colors.black.withOpacity(0.3),
            width: 2,
            style: BorderStyle.solid
        ),
      ),
      child: Consumer<DetectorProvider>(
        builder: (context, provider, child) {
          return Visibility(
            visible: provider.imagePath == null,
            replacement: Stack(
              fit: StackFit.expand,
              children: [
                provider.imagePath != null ? Image.memory(provider.imagePath!, fit: BoxFit.cover,) : const SizedBox.shrink(),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: InkWell(
                    splashColor: Colors.blue,
                    focusColor: Colors.red,
                    hoverColor: Colors.orange,
                    onTap: !provider.isLoading ? () async {
                      Uint8List? imgPath = await AppUtil.instance.pickImage();
                      provider.setImagePath(imgPath);
                    } : null,
                    child: Container(
                      height: 40,
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.history, color: Colors.white, size: 24,),
                          const SizedBox(width: 8,),
                          Text("Pilih Lagi", style: AppTextStyle.regular12White,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            child: Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: !provider.isLoading ? () async {
                  Uint8List? imgPath = await AppUtil.instance.pickImage();
                  provider.setImagePath(imgPath);
                } : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera_alt_outlined, size: ResponsiveLayout.isMobile(context) ? 40 : 80, color: Colors.black.withOpacity(0.2),),
                    const SizedBox(height: 12,),
                    Text("Gambar yang digunakan diharapkan tidak blur atau buram untuk hasil yang lebih baik", style: AppTextStyle.regular14Black.copyWith(color: Colors.black.withOpacity(0.5)), textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
