import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/component/button/base_button.dart';
import 'package:sipp_mobile/component/input/base_input.dart';
import 'package:sipp_mobile/component/other/snackbar.dart';
import 'package:sipp_mobile/enums/button_style.dart';
import 'package:sipp_mobile/provider/auth/auth_provider.dart';
import 'package:sipp_mobile/repository/auth/auth_repo.dart';
import 'package:sipp_mobile/util/app_navigation.dart';
import 'package:sipp_mobile/view/dashboard/widget/header_widget.dart';
import 'package:sipp_mobile/view/login/login_screen.dart';

import '../../constant/textstyles.dart';
import '../../injector.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        AuthProvider provider = AuthProvider(locator<AuthRepo>());
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await provider.loadProfile();
        });
        return provider;
      } ,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderWidget(),
                const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Data Pribadi", style: AppTextStyle.bold14Black,),
                      const SizedBox(height: 16,),
                      Selector<AuthProvider, String?>(
                        selector: (p0, provider) => provider.name,
                        builder: (context, name, child) {
                          return BaseInput(
                              enabled: false,
                              controller: TextEditingController(),
                              fillColor: Colors.grey.shade300,
                              hint: name ?? "-"
                          );
                        },
                      ),
                      const SizedBox(height: 16,),
                      Selector<AuthProvider, String?>(
                        selector: (p0, provider) => provider.email,
                        builder: (context, email, child) {
                          return BaseInput(
                              enabled: false,
                              controller: TextEditingController(),
                              fillColor: Colors.grey.shade300,
                              hint: email ?? "-"
                          );
                        },
                      ),
                      const SizedBox(height: 24,),
                      Consumer<AuthProvider>(
                        builder: (context, provider, child) {
                          return BaseButton(
                              buttonStyle: AppButtonStyle.redFilled,
                              onPressed: () async {
                                await context.read<AuthProvider>().logout();
                                if(provider.logoutResponse?.code == 200) {
                                  AppNavigation.instance.pushAndRemoveUntil(page: const LoginBase());
                                } else {
                                  EasyLoading.dismiss();
                                  AppSnackBar.instance.show(provider.logoutResponse?.message ?? "Terjadi Kesalahan, Coba Beberapa Saat Lagi");
                                }
                              },
                              child: child!
                          );
                        },
                        child: Text("Keluar", style: AppTextStyle.regular12White,),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
