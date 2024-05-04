import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/model/osm_model.dart';
import 'package:sipp_mobile/view/detector/widget/detector_handler.dart';

import '../../../constant/colors.dart';
import '../../../constant/textstyles.dart';
import '../../../provider/detector/detector_provider.dart';

class ImageResultWidget extends StatelessWidget {

  final TextEditingController provinceController;
  final TextEditingController locationController;

  const ImageResultWidget({Key? key, required this.provinceController, required this.locationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetectorProvider>(
      builder: (context, provider, child) => Visibility(
          visible: provider.isLoading == true,
          replacement: Visibility(
            visible: provider.pic.isNotEmpty && !provider.isLoading,
            child: Column(
              children: [
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
                      Text("Hasil Deteksi", style: AppTextStyle.bold14Black,),
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
                      const SizedBox(height: 24,),
                      Text("Informasi Penelitian", style: AppTextStyle.bold14Black,),
                      const SizedBox(height: 16,),
                      ListTile(
                        title: Text(provider.selectedLocation == null ? 'Pilih Lokasi Penelitian (Wajib)' :
                        "${provider.selectedLocation?.displayname}\nLatitude: ${provider.selectedLocation?.lat}\nLongitude: ${provider.selectedLocation?.lon}", style: AppTextStyle.regular12Black,),
                        trailing: Icon(Icons.check_circle_rounded, color: provider.selectedLocation == null ? Colors.grey : Colors.green, size: 24,),
                        onTap: () async {
                          OpenStreetMapModel? selected = await DetectorHandler.showLocationSelection();
                          provider.setLocation(selected);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 24,),
                CircularProgressIndicator(color: AppColor.primaryColor,),
              ],
            ),
          )),
    );
  }
}