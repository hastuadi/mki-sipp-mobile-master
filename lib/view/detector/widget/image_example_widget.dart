import 'package:flutter/material.dart';

import '../../../constant/textstyles.dart';

class ImageExampleWidget extends StatelessWidget {
  const ImageExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
