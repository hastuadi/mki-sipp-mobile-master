import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/component/other/responsive_layout.dart';
import 'package:sipp_mobile/constant/app_constant.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/constant/textstyles.dart';
import 'package:sipp_mobile/provider/app_provider.dart';
import 'package:sipp_mobile/util/app_navigation.dart';
import 'package:sipp_mobile/view/dashboard/widget/agenda_widget.dart';
import 'package:sipp_mobile/view/dashboard/widget/main_menu_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../injector.dart';
import '../../provider/auth/auth_provider.dart';
import '../../repository/auth/auth_repo.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  DateTime _selectedDate = DateTime.now();

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
                Visibility(
                  visible: ResponsiveLayout.isDesktop(context) || ResponsiveLayout.isTablet(context),
                  replacement: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MenuWidget(),
                      const SizedBox(height: 24,),
                      Container(
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
                        width: 400,
                        child: TableCalendar(
                          headerStyle: const HeaderStyle(
                              formatButtonVisible: false
                          ),
                          firstDay: DateTime.utc(2020, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: DateTime.now(),
                          headerVisible: true,
                          weekNumbersVisible: false,
                          enabledDayPredicate: (day) => true,
                          selectedDayPredicate: (day) {
                            return _selectedDate == day;
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDate = selectedDay;
                            });
                          },
                          eventLoader: (day) => [],
                          calendarStyle: CalendarStyle(
                              selectedDecoration: BoxDecoration(
                                  color: AppColor.greenColor
                              ),
                              todayDecoration: BoxDecoration(
                                  color: AppColor.greenColor.withOpacity(0.5)
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 24,),
                      AgendaWidget(selectedDate: _selectedDate)
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(child: MenuWidget()),
                      const SizedBox(width: 24,),
                      Expanded(
                        child: Container(
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
                          // width: 400,
                          child: TableCalendar(
                            headerStyle: const HeaderStyle(
                                formatButtonVisible: false
                            ),
                            firstDay: DateTime.utc(2020, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: DateTime.now(),
                            headerVisible: true,
                            weekNumbersVisible: false,
                            enabledDayPredicate: (day) => true,
                            selectedDayPredicate: (day) {
                              return _selectedDate == day;
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _selectedDate = selectedDay;
                              });
                            },
                            eventLoader: (day) => [],
                            calendarStyle: CalendarStyle(
                                selectedDecoration: BoxDecoration(
                                    color: AppColor.greenColor
                                ),
                                todayDecoration: BoxDecoration(
                                    color: AppColor.greenColor.withOpacity(0.5)
                                )
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24,),
                      Expanded(child: AgendaWidget(selectedDate: _selectedDate))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
