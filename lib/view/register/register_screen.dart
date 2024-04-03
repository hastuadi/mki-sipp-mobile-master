import 'package:flutter/material.dart';
import 'package:sipp_mobile/component/button/base_button.dart';
import 'package:sipp_mobile/component/input/base_input.dart';
import 'package:sipp_mobile/constant/textstyles.dart';
import 'package:sipp_mobile/enums/button_style.dart';
import 'package:sipp_mobile/util/app_navigation.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController nameController = TextEditingController();

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Selamat Datang peneliti!", style: AppTextStyle.bold18Black,),
                    const SizedBox(height: 3,),
                    Text("Daftar untuk menggunakan aplikasi", style: AppTextStyle.regular14Black,),
                    const SizedBox(height: 24,),
                    BaseInput(controller: nameController, hint: "Nama Lengkap"),
                    const SizedBox(height: 16,),
                    BaseInput(controller: nameController, hint: "Email", keyboardType: TextInputType.emailAddress,),
                    const SizedBox(height: 16,),
                    BaseInput(controller: nameController, hint: "Password", obscureText: true,),
                    const SizedBox(height: 16,),
                    BaseInput(controller: nameController, hint: "Konfirmasi Password", obscureText: true),
                  ],
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
              onPressed: null,
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
