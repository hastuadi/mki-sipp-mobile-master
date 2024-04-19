import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sipp_mobile/component/other/shimmer.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/model/research_detail_response.dart';
import 'package:sipp_mobile/provider/research/research_detail_provider.dart';
import 'package:sipp_mobile/repository/research/research_repo.dart';

import '../../constant/textstyles.dart';
import '../../injector.dart';

class ResearchDetail extends StatelessWidget {

  final int researchId;

  const ResearchDetail({Key? key, required this.researchId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        ResearchDetailProvider provider = ResearchDetailProvider(locator<ResearchRepo>());
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await provider.getDetail(researchId);
        });
        return provider;
      },
      child: Scaffold(
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
                Consumer<ResearchDetailProvider>(
                  builder: (context, provider, child) => Visibility(
                    visible: !provider.isLoading,
                    replacement: const AppShimmer(height: 280, width: double.infinity),
                    child: CachedNetworkImage(
                      height: 280,
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                      imageUrl: provider.detailResponse?.baseResourcePath ?? "",
                      placeholder: (context, url) {
                        return const AppShimmer(height: 280, width: double.infinity);
                      },
                      errorWidget: (context, url, error) {
                        return Container(height: 280, width: double.infinity, decoration: BoxDecoration(
                            color: Colors.grey.shade300
                        ),
                        child: Center(child: Text("Can't load image", style: AppTextStyle.regular12Black26,),),);
                      },
                    ),
                  ),
                ),
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
                        Consumer<ResearchDetailProvider>(
                          builder: (context, provider, child) => Visibility(
                            visible: !provider.isLoading,
                              replacement: const AppShimmer(height: 20, width: 100),
                              child: Text("${provider.detailResponse?.location} (${provider.detailResponse?.province})", 
                                style: AppTextStyle.regular14Black,)
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Objek", style: AppTextStyle.regular12Grey,),
                        Consumer<ResearchDetailProvider>(
                            builder: (context, provider, child) {
                              return Visibility(
                                visible: !provider.isLoading,
                                  replacement: const AppShimmer(height: 20, width: 100),
                                  child: Text(provider.detailResponse?.totalObject.toString() ?? "-", style: AppTextStyle.regular14Black,)
                              );
                            },
                        ),
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
                  child: Consumer<ResearchDetailProvider>(
                    builder: (context, provider, child) {
                      return ListView.builder(
                        itemCount: provider.isLoading ? 3 : provider.detailResponse?.regions?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Visibility(
                            visible: !provider.isLoading,
                            replacement: const Row(
                              children: [
                                AppShimmer(height: 100, width: 100),
                                SizedBox(width: 10,)
                              ],
                            ),
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                    imageUrl: provider.detailResponse?.regions?[index].regionResourcePath ?? "-",
                                  fit: BoxFit.fitHeight,
                                  placeholder: (context, url) => const AppShimmer(height: 150, width: 150),
                                  errorWidget: (context, url, error) {
                                    return Container(height: 280, width: double.infinity, decoration: BoxDecoration(
                                        color: Colors.grey.shade300
                                    ),
                                      child: Center(child: Text("Can't load image", style: AppTextStyle.regular12Black26,),),);
                                  },
                                ),
                                const SizedBox(width: 10,)
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24,),
                Visibility(visible: false, child: Text("Review", style: AppTextStyle.bold14Black,)),
                const Visibility(visible: false, child: SizedBox(height: 8,)),
                Visibility(
                  visible: false,
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: 0,
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
                                  Expanded(child: Text("Reviewer", style: AppTextStyle.bold12Black, maxLines: 2, overflow: TextOverflow.ellipsis,))
                                ],
                              ),
                              Expanded(child: Text("Review Text Should be here", style: AppTextStyle.regular12Black, maxLines: 2, overflow: TextOverflow.ellipsis,))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
