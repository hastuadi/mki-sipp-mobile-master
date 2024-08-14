import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/component/other/responsive_layout.dart';
import 'package:sipp_mobile/constant/app_constant.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/constant/textstyles.dart';
import 'package:sipp_mobile/enums/button_style.dart';
import 'package:sipp_mobile/provider/app_provider.dart';
import 'package:sipp_mobile/util/app_navigation.dart';
import 'package:sipp_mobile/view/dashboard/widget/header_widget.dart';
import 'package:sipp_mobile/view/dashboard/widget/menu_widget.dart';

import '../../injector.dart';
import '../../provider/auth/auth_provider.dart';
import '../../repository/auth/auth_repo.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

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
      child: Scaffold(
        backgroundColor: Colors.grey[35],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const HeaderWidget(),
                // const SizedBox(height: 8,),
                Text(context.read<AppProvider>().currentDate, style: AppTextStyle.regular24Black,),
                const SizedBox(height: 16,),
                Text("Selamat Datang", style: AppTextStyle.regular12Black,),
                const SizedBox(height: 2,),
                Selector<AuthProvider, String?>(
                  selector: (p0, provider) => provider.name,
                  builder: (context, value, child) => Text(value ?? "-",
                    style: AppTextStyle.bold14Black,),
                ),
                const SizedBox(height: 16,),
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 7,
                            spreadRadius: 5,
                            offset: const Offset(0, 1)
                        )
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Menu Utama", style: AppTextStyle.regular14Black,),
                      const SizedBox(height: 16,),
                      Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          title: Text("Penelitian Lapangan", style: AppTextStyle.bold14Black,),
                          subtitle: Text('Laporan hasil penelitian lapangan yang sudah di lakukan', style: AppTextStyle.regular12Black,),
                          leading: Icon(Icons.search_off_rounded, color: AppColor.purple,),
                          splashColor: Colors.grey[250],
                          hoverColor: Colors.grey[100],
                          onTap: () {
                            AppNavigation.instance.push(path: AppConstant.researchListRoute);
                          },
                        ),
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          title: Text("Program Deteksi Objek", style: AppTextStyle.bold14Black,),
                          subtitle: Text('Pendeteksian secara langsung untuk menunjang penelitian', style: AppTextStyle.regular12Black,),
                          leading: Icon(Icons.settings_overscan_sharp, color: AppColor.bgGreenColor,),
                          splashColor: Colors.grey[250],
                          hoverColor: Colors.grey[100],
                          onTap: () {
                            AppNavigation.instance.push(path: AppConstant.researchDetectRoute);
                          },
                        ),
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          title: Text("Kompres Gambar", style: AppTextStyle.bold14Black,),
                          subtitle: Text('Pendeteksian secara langsung untuk menunjang penelitian', style: AppTextStyle.regular12Black,),
                          leading: Icon(Icons.photo_size_select_actual_outlined, color: AppColor.deepBlue,),
                          splashColor: Colors.grey[250],
                          hoverColor: Colors.grey[100],
                          onTap: () {
                            AppNavigation.instance.push(path: AppConstant.imageCompressor);
                          },
                        ),
                      ),
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
