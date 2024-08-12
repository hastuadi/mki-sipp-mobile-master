import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/provider/auth/auth_provider.dart';
import 'package:sipp_mobile/repository/auth/auth_repo.dart';

import '../../../constant/colors.dart';
import '../../../constant/textstyles.dart';
import '../../../injector.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        AuthProvider provider = AuthProvider(locator<AuthRepo>());
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await provider.loadProfile();
        });
        return provider;
      },
      child: Stack(
        children: [
          SizedBox(
            height: 290,
            child: Container(
              color: AppColor.bgGreenColor,
            ),
          ),
          Positioned(
            left: -100,
            top: -87,
            child: Image.asset('assets/images/general/white-round-bg-icon.png'),
          ),
          Positioned(
            bottom: 48,
            left: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Selamat Datang", style: AppTextStyle.regular12White,),
                const SizedBox(height: 2,),
                Selector<AuthProvider, String?>(
                  selector: (p0, provider) => provider.name,
                    builder: (context, value, child) => Text(value ?? "-",
                      style: AppTextStyle.bold18White,),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
