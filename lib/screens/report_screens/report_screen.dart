import 'package:driver_app/utils/colors.dart';
import 'package:driver_app/utils/font-styles.dart';
import 'package:driver_app/widgets/report/chips.dart';
import 'package:driver_app/widgets/report/graph.dart';
import 'package:driver_app/widgets/report/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool isOnDuty = true;
  bool showContainer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200, // Set the width of the button
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isOnDuty ? Colors.grey : colorBrightGreen,
                      ),
                      onPressed: () {
                        setState(() {
                          isOnDuty = !isOnDuty; // Toggle the duty status
                        });
                      },
                      child: Text(
                        isOnDuty ? 'END DUTY' : 'START DUTY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/svgs/bell.svg',
                    height: 30,
                  ),
                  isOnDuty ? Image.asset('assets/images/sos.png') : SizedBox(),
                  Text(
                    'Help',
                    style: TextStyle(
                      color: colorGreen,
                      fontSize: mediumLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF47D3FF), Color(0xFF5A00CF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        width: 2,
                        color: Color(
                          0xFF5CC7FA,
                        ))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today’s Earnings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: mediumLarge,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '₹ 410',
                      style: TextStyle(
                        color: yellowTextColor,
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'This week Earnings : ₹2305',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: medium,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Earning Report',
                style: TextStyle(
                  fontSize: veryLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ChipRow(),
              BarChartSample4(),
              SizedBox(
                height: 30,
              ),
              Stats(),
              SizedBox(
                height: 20,
              ),
              Stats(),
              SizedBox(
                height: 20,
              ),
              Stats()
            ],
          ),
        ),
      ),
    );
  }
}
