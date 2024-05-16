import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sipp_mobile/util/app_navigation.dart';

import '../../component/other/shimmer.dart';
import '../../constant/textstyles.dart';

class ResearchHandler {
  ResearchHandler._private();

  static ResearchHandler instance = ResearchHandler._private();

  factory ResearchHandler() {
    return instance;
  }

  void showImageDetail(String? imageUrl, int? total, double? luasan) {
    showModalBottomSheet(context: AppNavigation.instance.getContext()!, builder: (context) {
      return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Lihat Gambar", style: AppTextStyle.bold14Black,),
              const SizedBox(height: 16,),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: InteractiveViewer(
                    panEnabled: true,
                    minScale: 0.5,
                    maxScale: 6,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl ?? "-",
                      fit: BoxFit.fitHeight,
                      placeholder: (context, url) => const AppShimmer(height: 150, width: 150),
                      errorWidget: (context, url, error) {
                        return Container(height: 280, width: double.infinity, decoration: BoxDecoration(
                            color: Colors.grey.shade300
                        ),
                          child: Center(child: Text("Can't load image", style: AppTextStyle.regular12Black26,),),);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              Text("Total Objek", style: AppTextStyle.regular12Grey,),
              const SizedBox(height: 8,),
              Text(total.toString() , style: AppTextStyle.regular14Black,),
              const SizedBox(height: 16,),
              Text("Total Luasan", style: AppTextStyle.regular12Grey,),
              const SizedBox(height: 8,),
              Text("${luasan.toString()} m²" , style: AppTextStyle.regular14Black,)
            ],
          ),
        ),
      );
    },);
  }

}