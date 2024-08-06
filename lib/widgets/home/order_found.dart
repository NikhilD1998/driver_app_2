import 'package:driver_app/utils/colors.dart';
import 'package:driver_app/widgets/home/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../utils/font-styles.dart';

class OrderFound extends StatelessWidget {
  const OrderFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.grey[300]!,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Earning',
                            style: TextStyle(
                              fontSize: small,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '₹35',
                            style: TextStyle(
                              color: colorBrightGreen,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/greenlocationicon.png',
                              ),
                              Text(
                                '  4.7 KM',
                                style: TextStyle(
                                  fontSize: small,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset('assets/images/timer.png'),
                              Text(
                                '  16 Mins',
                                style: TextStyle(
                                  fontSize: small,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.storefront,
                                color: colorBrightGreen,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shiva Chinese Wok',
                                    style: TextStyle(
                                      color: colorBrightGreen,
                                      fontSize: mediumSmall,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '4, Tilak nagar main road...',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: small,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Positioned(
                                left: 15, // Adjust based on icon alignment
                                top: 0, // Adjust based on icon size
                                bottom: 40,
                                child: CustomPaint(
                                  size: Size(1,
                                      70), // Adjust height based on requirement
                                  painter: DottedLinePainter(),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                      height: 60), // Adjust based on icon size
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        '330, sampat greens,\nkanadiya road,',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID: #47894267',
                            style: TextStyle(
                                fontSize: mediumSmall,
                                color: colorBrightGreen,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Today, 10:40 PM',
                            style: TextStyle(
                              fontSize: small,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              decoration: BoxDecoration(
                                  color: colorBrightGreen,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                'New',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                          Text('To Apeksha Sharma')
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8))),
                        child: Center(
                            child: Text(
                          'Decline',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: colorBrightGreen,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8))),
                        child: Center(
                            child: Text(
                          'Accept',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
