import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constant/textstyles.dart';

class AgendaWidget extends StatelessWidget {
  final DateTime selectedDate;
  const AgendaWidget({Key? key, required this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text("Agenda Tanggal ${DateFormat('dd-MM-yyyy').format(selectedDate)}", style: AppTextStyle.regular14Black,),
            const SizedBox(height: 24,),
            Text("Tidak ada agenda", style: AppTextStyle.regular12Black,)
          ],
        )
    );
  }
}
