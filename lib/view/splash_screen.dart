import 'package:flutter/material.dart';
import 'package:sipp_mobile/constant/textstyles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: -100,
            top: -87,
            child: Image.asset('assets/images/general/round-bg-icon.png'),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/general/app-icon.png'),
                      const SizedBox(height: 31,),
                      Text("SIPP", style: AppTextStyle.bold24Black,),
                      Text("Sistem Informasi Penunjang Penelitian", style: AppTextStyle.regular14Black,),
                    ],
                  ),
                ),
                Text("Versi aplikasi 1.0.0", style: AppTextStyle.regular14Black, textAlign: TextAlign.center,),
                const SizedBox(height: 24,)
              ],
            ),
          ),
          Positioned(
            right: -100,
            bottom: -87,
            child: Image.asset('assets/images/general/round-bg-icon.png'),
          ),
        ],
      ),
    );
  }
}
