import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/component/other/snackbar.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/injector.dart';
import 'package:sipp_mobile/provider/detector/detector_provider.dart';
import 'package:sipp_mobile/repository/detector/detector_repo.dart';
import 'package:sipp_mobile/view/detector/widget/detector_handler.dart';
import 'package:sipp_mobile/view/detector/widget/frame_image_widget.dart';
import 'package:sipp_mobile/view/detector/widget/image_example_widget.dart';
import 'package:sipp_mobile/view/detector/widget/image_result_widget.dart';

import '../../component/button/base_button.dart';
import '../../constant/textstyles.dart';
import '../../enums/button_style.dart';

class DetectorScreen extends StatelessWidget {
  const DetectorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetectorProvider(locator<DetectorRepo>()),
      child: const DetectorScreenBody(),
    );
  }
}


class DetectorScreenBody extends StatefulWidget {
  const DetectorScreenBody({super.key});

  @override
  State<DetectorScreenBody> createState() => _DetectorScreenBodyState();
}

class _DetectorScreenBodyState extends State<DetectorScreenBody> {

  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _provinceController.dispose();
    _locationController.dispose();
    super.dispose();
  }

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
        child: Form(
          key: _formKey,
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
                      onTap: () async {
                        DetectorProvider provider =  context.read<DetectorProvider>();
                        int? maxRegion = await DetectorHandler.showRegionField();
                        provider.setMaxRegion(region: maxRegion ?? 1);
                      },
                      child: Row(
                        children: [
                          Text("Pengaturan tambahan", style: AppTextStyle.regular12Black,),
                          const SizedBox(width: 4,),
                          Icon(Icons.settings, color: AppColor.deepBlue, size: 16,)
                        ],
                      ),
                    ),
                    ImageResultWidget(
                      locationController: _locationController,
                      provinceController: _provinceController,
                    ),
                    const SizedBox(height: 24,),
                    const ImageExampleWidget(),
                    const SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Selector<DetectorProvider, bool>(
                            selector: (p0, provider) => provider.isLoading,
                            builder: (context, loading, child) => BaseButton(
                              onPressed: !loading ? () async {
                                DetectorProvider provider = context.read<DetectorProvider>();
                                bool cancel = await DetectorHandler.showCancelConfirmation();
                                if(cancel) provider.reset();
                              } : null,
                              buttonStyle: AppButtonStyle.redFilled,
                              child: Text("Ulangi", style: AppTextStyle.regular14White,),
                            ),
                          ),
                        ),
                        const SizedBox(width: 24,),
                        Expanded(
                          child: Consumer<DetectorProvider>(
                            builder: (context, provider, child) => BaseButton(
                              onPressed: !provider.isLoading && provider.selectedLocation == null && (provider.detectionResultResponse == null) ? () async {
                                await context.read<DetectorProvider>().detect();
                                if(provider.detectionResultResponse == null && provider.detectionError != null) {
                                  AppSnackBar.instance.show("Terjadi Kesalahan, Coba Beberapa Saat Lagi");
                                } else if (provider.detectionResultResponse?.code != 200 && provider.detectionError == null) {
                                  AppSnackBar.instance.show(provider.detectionResultResponse?.message);
                                }
                              } : !provider.isLoading && provider.selectedLocation != null && (provider.detectionResultResponse?.regions?.isNotEmpty ?? false) ? () async {
                                DetectorProvider provider = context.read<DetectorProvider>();
                                await provider.save();
                                if(provider.saveResponse == null && provider.detectionError != null) {
                                  AppSnackBar.instance.show("Terjadi Kesalahan, Coba Beberapa Saat Lagi");
                                } else if (provider.saveResponse?.code != 200 && provider.detectionError == null) {
                                  AppSnackBar.instance.show(provider.saveResponse?.message);
                                } else {
                                  await provider.reset();
                                }
                              } : null,
                              buttonStyle: AppButtonStyle.filled,
                              child: Text((provider.detectionResultResponse != null) ? "Simpan" : "Deteksi", style: AppTextStyle.regular14White,),
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
        ),
      )
    );
  }
}
