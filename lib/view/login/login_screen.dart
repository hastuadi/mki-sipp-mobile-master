import 'package:flutter/material.dart';

import '../../component/button/base_button.dart';
import '../../component/input/base_input.dart';
import '../../constant/textstyles.dart';
import '../../enums/button_style.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/general/app-icon.png'),
                    const SizedBox(height: 16,),
                    Text("SIPP", style: AppTextStyle.bold24Black,),
                    Text("Sistem Informasi Penunjang Penelitian", style: AppTextStyle.regular14Black,),
                    const SizedBox(height: 24,),
                    BaseInput(controller: TextEditingController(), hint: "Nama Lengkap"),
                    const SizedBox(height: 16,),
                    BaseInput(controller: TextEditingController(), hint: "Password", obscureText: true,),
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
              child: Text("Masuk", style: AppTextStyle.bold12White,),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum punya akun?", style: AppTextStyle.regular14Black,),
                const SizedBox(width: 3,),
                InkWell(
                    onTap: () {},
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
