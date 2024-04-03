import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/provider/dashboard/bottom_nav_bar_provider.dart';
import 'package:sipp_mobile/view/dashboard/homepage_screen.dart';
import 'package:sipp_mobile/view/register/register_screen.dart';

class DashboardBottomNavBar extends StatelessWidget {

  const DashboardBottomNavBar({Key? key}) : super(key: key);

  static const List<Widget> menu = [
    HomePageScreen(),
    Register()
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavBarProvider(),
      child: Scaffold(
        body: Selector<BottomNavBarProvider, int>(
          selector: (p0, provider) => provider.selectedIndex,
          builder: (context, index, child) => menu[index],
        ),
        bottomNavigationBar: Selector<BottomNavBarProvider, int>(
          selector: (p0, provider) => provider.selectedIndex,
          builder: (context, index, child) => BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Beranda",
                  activeIcon: Icon(Icons.home_filled)
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: "Akun",
                  activeIcon: Icon(Icons.settings)
              )
            ],
            currentIndex: index,
            backgroundColor: Colors.white,
            selectedItemColor: AppColor.primaryColor,
            onTap: (indexTab) {
              context.read<BottomNavBarProvider>().changeTabMenu(indexTab);
            },
          ),
        ),
      ),
    );
  }
}
