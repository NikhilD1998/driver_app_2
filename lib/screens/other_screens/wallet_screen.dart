import 'package:driver_app/utils/colors.dart';
import 'package:driver_app/utils/font-styles.dart';
import 'package:driver_app/widgets/wallet/left_image_container.dart';
import 'package:driver_app/widgets/wallet/right_image_container.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Wallet',
                  style: TextStyle(
                    fontSize: large,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    border: Border.all(
                      width: 2,
                      color: borderColor,
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'AVAILABLE BALANCE',
                      style: TextStyle(
                        color: colorGreen,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF47D3FF),
                              Color(0xFF5A00CF),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/wallet.png'),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '87.61',
                            style: TextStyle(
                              fontSize: 39,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Wallet cash can be used for boosting promotions',
                style: TextStyle(
                  color: colorGray,
                  fontSize: small,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 180,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: colorGreen,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Veiw Earnings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Refer and earn program',
                  style: TextStyle(
                    fontSize: large,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/speaker.png'),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                      'Refer a friend to Nukkad\nfoods and you both earn ₹50\nwhen they place their first\norder!'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 250,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: colorGreen,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Copy your code',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mediumSmall,
                            fontWeight: FontWeight.bold,
                          ), // Example style
                          children: <TextSpan>[
                            TextSpan(
                              text: ' 58vt3x1',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Example style
                                fontSize: mediumSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.copy,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 3,
                        color: colorGreen,
                      )),
                  child: Text(
                    'INVITE',
                    style: TextStyle(
                      color: colorGreen,
                      fontSize: medium,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'HOW DOES REFER AND EARN WORK?',
                  style: TextStyle(
                    fontSize: mediumSmall,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LeftImageContainer(
                  imagePath: 'assets/images/women.png',
                  count: '1.',
                  message:
                      'Share referral link using\nWhatsapp, SMS, and\nmore.'),
              SizedBox(
                height: 20,
              ),
              RightImageContainer(
                  imagePath: 'assets/images/phone.png',
                  count: '2.',
                  message:
                      'Your friend Registers on\nthe link to download the\nnukkad app or uses your\nreferral code!'),
              SizedBox(
                height: 20,
              ),
              LeftImageContainer(
                  imagePath: 'assets/images/package.png',
                  count: '3.',
                  message: 'Friend completes their\nfirst order.'),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: colorGray)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '4.',
                          style: TextStyle(
                            color: colorGreen,
                            fontSize: large,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'You both earn 50 nukkad coins each, that can\nbe converted to wallet cash and can be used\nfor promotions orders. ',
                          style: TextStyle(
                            fontSize: small,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset('assets/images/money.png'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
