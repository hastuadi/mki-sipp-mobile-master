import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sipp_mobile/constant/colors.dart';

import '../../constant/textstyles.dart';

class ResearchDetail extends StatelessWidget {
  const ResearchDetail({Key? key}) : super(key: key);

  static const List<String> dummyImages = [
    "assets/images/general/region_1_resized.jpg",
    "assets/images/general/region_2_resized.jpg",
    "assets/images/general/region_3_resized.jpg",
  ];

  static const List<String> dumyNames = [
    "Rafi Mochamad Fahreza",
    "Dimas Chandra",
    "Mohamad Noor Fauzi",
    "Suhatono",
  ];

  static const List<String> dummyReviews = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
  ];

  @override
  Widget build(BuildContext context) {
    EasyLoading.show();
    Future.delayed(const Duration(seconds: 3), () {
      EasyLoading.dismiss();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Detail Penelitian", style: AppTextStyle.bold14),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/general/ground_resized.jpg", height: 280,  width: double.infinity, fit: BoxFit.cover,),
              const SizedBox(height: 24,),
              Text("Hasil Penelitian", style: AppTextStyle.bold14Black,),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lokasi Penelitian", style: AppTextStyle.regular12Grey,),
                      Text("Aceh", style: AppTextStyle.regular14Black,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Objek", style: AppTextStyle.regular12Grey,),
                      Text("300", style: AppTextStyle.regular14Black,),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24,),
              Text("Lampiran Penelitian", style: AppTextStyle.bold14Black,),
              const SizedBox(height: 8,),
              Text("(Klik pada gambar untuk perjelas)", style: AppTextStyle.regular12Grey,),
              const SizedBox(height: 20,),
              SizedBox(
                height: 106,
                child: ListView.builder(
                  itemCount: dummyImages.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Image.asset(dummyImages[index], fit: BoxFit.cover,),
                          const SizedBox(width: 10,)
                        ],
                      );
                    },
                ),
              ),
              const SizedBox(height: 24,),
              Text("Review", style: AppTextStyle.bold14Black,),
              const SizedBox(height: 8,),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: dummyReviews.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 235,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: AppColor.lightGrey,
                          width: 1
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/general/user-icon.png"),
                              const SizedBox(width: 4,),
                              Expanded(child: Text(dumyNames[index], style: AppTextStyle.bold12Black, maxLines: 2, overflow: TextOverflow.ellipsis,))
                            ],
                          ),
                          Expanded(child: Text(dummyReviews[index], style: AppTextStyle.regular12Black, maxLines: 2, overflow: TextOverflow.ellipsis,))
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24,),
            ],
          ),
        ),
      ),
    );
  }
}
