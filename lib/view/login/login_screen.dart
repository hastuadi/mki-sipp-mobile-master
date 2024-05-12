import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/component/other/responsive_layout.dart';
import 'package:sipp_mobile/component/other/snackbar.dart';
import 'package:sipp_mobile/constant/app_constant.dart';
import 'package:sipp_mobile/model/request/login_request.dart';
import 'package:sipp_mobile/provider/auth/auth_provider.dart';
import 'package:sipp_mobile/repository/auth/auth_repo.dart';
import 'package:sipp_mobile/util/app_navigation.dart';

import '../../component/button/base_button.dart';
import '../../component/input/base_input.dart';
import '../../constant/textstyles.dart';
import '../../enums/button_style.dart';
import '../../injector.dart';

class LoginBase extends StatelessWidget {
  const LoginBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthProvider(locator<AuthRepo>()),
      child: const Login(),
    );
  }
}


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _handleLogin() {
    if(context.read<AuthProvider>().loginResponse?.code != 200) {
      AppSnackBar.instance.show(context.read<AuthProvider>().loginResponse?.message);
    } else {
      AppNavigation.instance.neglect(path: AppConstant.dashboardRoute);
    }
  }

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
            child: Visibility(
              visible: ResponsiveLayout.isMobile(context),
              replacement: SizedBox(
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/general/app-icon.png'),
                          const SizedBox(height: 16,),
                          Text("SIPP", style: AppTextStyle.bold24Black,),
                          Text("Sistem Informasi Penunjang Penelitian", style: AppTextStyle.regular14Black,),
                          const SizedBox(height: 24,),
                          BaseInput(controller: _emailController, hint: "Email"),
                          const SizedBox(height: 16,),
                          BaseInput(controller: _passwordController, hint: "Password", obscureText: true,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/general/app-icon.png'),
                        const SizedBox(height: 16,),
                        Text("SIPP", style: AppTextStyle.bold24Black,),
                        Text("Sistem Informasi Penunjang Penelitian", style: AppTextStyle.regular14Black,),
                        const SizedBox(height: 24,),
                        BaseInput(controller: _emailController, hint: "Email"),
                        const SizedBox(height: 16,),
                        BaseInput(controller: _passwordController, hint: "Password", obscureText: true,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: ResponsiveLayout.isMobile(context) ? null : 500,
              child: BaseButton(
                onPressed: () async {
                  await context.read<AuthProvider>().login(LoginRequest(
                    email: _emailController.text.toString(),
                    password: _passwordController.text.toString()
                  ));
                  _handleLogin();
                },
                buttonStyle: AppButtonStyle.filled,
                child: Text("Masuk", style: AppTextStyle.bold12White,),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum punya akun?", style: AppTextStyle.regular14Black,),
                const SizedBox(width: 3,),
                InkWell(
                    onTap: () {
                      AppNavigation.instance.push(path: AppConstant.registerRoute);
                    },
                    child: Text("Daftar", style: AppTextStyle.bold14Primary,)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
