import 'package:flutter/material.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/view/detector/widget/frame_image_widget.dart';
import 'package:sipp_mobile/view/detector/widget/region_field_widget.dart';

import '../../component/button/base_button.dart';
import '../../constant/textstyles.dart';
import '../../enums/button_style.dart';

class DetectorScreen extends StatelessWidget {
  const DetectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Deteksi Objek Langsung", style: AppTextStyle.bold14),
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
                        Text("Upload Gambar Baru", style: AppTextStyle.bold24Black),
                        const SizedBox(height: 8,),
                        Text("JPG, GIF, dan PNG tipe data yang diterima", style: AppTextStyle.regular12Black,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                  const FrameImage(),
                  const SizedBox(height: 8,),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Banyak region pada gambar:", style: AppTextStyle.regular12Black,),
                                      const RegionField()
                                    ],
                                  ),
                                  const SizedBox(height: 24,),
                                  SizedBox(
                                    width: double.infinity,
                                    child: BaseButton(
                                        buttonStyle: AppButtonStyle.filled,
                                        child: Text("Simpan", style: AppTextStyle.regular14White,)
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                      );
                    },
                    child: Row(
                      children: [
                        Text("Pengaturan tambahan", style: AppTextStyle.regular12Black,),
                        const SizedBox(width: 4,),
                        Icon(Icons.settings, color: AppColor.deepBlue, size: 16,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.3),
                          width: 2,
                          style: BorderStyle.solid
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rekomendasi Format Gambar yang diupload", style: AppTextStyle.bold14Black,),
                        const SizedBox(height: 8,),
                        Text("• Gambar sudah berupa region yang di targetkan", style: AppTextStyle.regular12Black,),
                        const SizedBox(height: 8,),
                        Text("• Pastikan gambar tidak blur/buram", style: AppTextStyle.regular12Black,),
                        const SizedBox(height: 16,),
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: BaseButton(
                          onPressed: () async {
                        
                          },
                          buttonStyle: AppButtonStyle.redFilled,
                          child: Text("Ulangi", style: AppTextStyle.regular12White,),
                        ),
                      ),
                      const SizedBox(width: 24,),
                      Expanded(
                        child: BaseButton(
                          onPressed: () async {
                        
                          },
                          buttonStyle: AppButtonStyle.filled,
                          child: Text("Deteksi", style: AppTextStyle.regular14White,),
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
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       SizedBox(
      //         width: ResponsiveLayout.isMobile(context) ? null : 500,
      //         child: BaseButton(
      //           onPressed: () async {
      //
      //           },
      //           buttonStyle: AppButtonStyle.filled,
      //           child: Text("Deteksi", style: AppTextStyle.bold12White,),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
