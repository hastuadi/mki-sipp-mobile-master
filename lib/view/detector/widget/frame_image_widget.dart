import 'package:flutter/material.dart';
import 'package:sipp_mobile/util/app_util.dart';

import '../../../component/other/responsive_layout.dart';
import '../../../constant/colors.dart';
import '../../../constant/textstyles.dart';

class FrameImage extends StatelessWidget {
  const FrameImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
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
      child: Visibility(
        child: Center(
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () async {
              await AppUtil.instance.pickImage();
            },
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
      ),
    );
  }
}
