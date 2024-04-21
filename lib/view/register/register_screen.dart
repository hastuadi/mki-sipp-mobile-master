import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/component/button/base_button.dart';
import 'package:sipp_mobile/component/input/base_input.dart';
import 'package:sipp_mobile/component/other/snackbar.dart';
import 'package:sipp_mobile/constant/textstyles.dart';
import 'package:sipp_mobile/enums/button_style.dart';
import 'package:sipp_mobile/model/request/register_request.dart';
import 'package:sipp_mobile/provider/auth/auth_provider.dart';
import 'package:sipp_mobile/repository/auth/auth_repo.dart';
import 'package:sipp_mobile/util/app_navigation.dart';

import '../../injector.dart';

class RegisterBase extends StatelessWidget {
  const RegisterBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(locator<AuthRepo>()),
      child: const Register(),
    );
  }
}


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmationPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmationPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Pendaftaran", style: AppTextStyle.bold14,),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: -100,
            top: -87,
            child: Image.asset('assets/images/general/round-bg-icon.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Selamat Datang peneliti!", style: AppTextStyle.bold18Black,),
                      const SizedBox(height: 3,),
                      Text("Daftar untuk menggunakan aplikasi", style: AppTextStyle.regular14Black,),
                      const SizedBox(height: 24,),
                      BaseInput(controller: nameController, hint: "Nama Lengkap", validator: (text) {
                        if(text == null|| text == "") {
                          return "Silahkan lengkapi form ini";
                        } else if(text.length < 3) {
                          return "Nama ini tidak valid";
                        }
                        return null;
                      },autovalidateMode: AutovalidateMode.onUserInteraction,),
                      const SizedBox(height: 16,),
                      BaseInput(controller: emailController, hint: "Email", keyboardType: TextInputType.emailAddress, validator: (text) {
                        if(text == null|| text == "") {
                          return "Silahkan lengkapi form ini";
                        } else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text)) {
                          return "Email tidak valid";
                        }
                        return null;
                      },autovalidateMode: AutovalidateMode.onUserInteraction,),
                      const SizedBox(height: 16,),
                      BaseInput(controller: passwordController, hint: "Password", obscureText: true, validator: (text) {
                        if(text == null|| text == "") {
                          return "Silahkan lengkapi form ini";
                        }
                        return null;
                      }, autovalidateMode: AutovalidateMode.onUserInteraction,),
                      const SizedBox(height: 16,),
                      BaseInput(controller: confirmationPasswordController, hint: "Konfirmasi Password", obscureText: true, validator: (text) {
                        if(text == null|| text == "") {
                          return "Silahkan lengkapi form ini";
                        } else if(text != passwordController.text) {
                          return "Password tidak sama";
                        }
                        return null;
                      },autovalidateMode: AutovalidateMode.onUserInteraction,),
                    ],
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
            BaseButton(
              onPressed: () async {
                formKey.currentState?.validate();
                RegisterRequest request = RegisterRequest(email: emailController.text.toString(), fullName: nameController.text.toString(), password: passwordController.text.toString());
                AuthProvider provider = context.read<AuthProvider>();
                await provider.createUser(request);
                if(provider.createUserResponse?.code == 201) {
                  AppSnackBar.instance.show("Register Berhasil");
                  AppNavigation.instance.pop();
                } else {
                  AppSnackBar.instance.show(provider.createUserResponse?.message ?? "Terjadi Kesalahan, Coba Beberapa Saat Lagi");
                }
              },
              buttonStyle: AppButtonStyle.filled,
              child: Text("Daftar", style: AppTextStyle.bold12White,),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah punya akun?", style: AppTextStyle.regular14Black,),
                const SizedBox(width: 3,),
                InkWell(
                  onTap: () {
                    AppNavigation.instance.pop();
                  },
                    child: Text("Masuk", style: AppTextStyle.bold14Primary,)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
