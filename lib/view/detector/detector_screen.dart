import 'package:flutter/material.dart';
import 'package:sipp_mobile/component/other/responsive_layout.dart';
import 'package:sipp_mobile/constant/colors.dart';

import '../../component/button/base_button.dart';
import '../../constant/textstyles.dart';
import '../../enums/button_style.dart';

class DetectorScreen extends StatelessWidget {
  const DetectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deteksi Objek Langsung", style: AppTextStyle.bold14),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: ResponsiveLayout.isDesktop(context) || ResponsiveLayout.isTablet(context) ? 310 : double.infinity,
                height: 310,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColor.black4d.withOpacity(0.3),
                    width: 2,
                    style: BorderStyle.solid
                  ),
                ),
                child: Visibility(
                  child: Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
        
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.camera_alt_rounded, size: 80, color: AppColor.black4d,),
                          const SizedBox(height: 12,),
                          Text("Upload Gambar Baru", style: AppTextStyle.regular14Black,)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24,),
              Text("Rekomendasi Format Gambar yang diupload", style: AppTextStyle.bold14Black,),
              const SizedBox(height: 8,),
              Text("• Gambar sudah berupa region yang di targetkan", style: AppTextStyle.regular12Black,),
              const SizedBox(height: 8,),
              Text("• Pastikan gambar tidak blur/buram", style: AppTextStyle.regular12Black,),
              const SizedBox(height: 24,),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const SizedBox(width: 14,),
                        Image.asset("assets/images/general/example_image_${index+1}.jpg"),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          child: BaseButton(
            onPressed: () async {

            },
            buttonStyle: AppButtonStyle.deepBlueFilled,
            child: Text("Deteksi", style: AppTextStyle.bold12White,),
          ),
        ),
      ),
    );
  }
}
