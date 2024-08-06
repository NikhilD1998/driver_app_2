import 'package:driver_app/widgets/common/menu.dart';
import 'package:driver_app/widgets/common/transition_to_next_screen.dart';
import 'package:driver_app/widgets/home/menu_item.dart';
import 'package:driver_app/widgets/home/order_found.dart';
import 'package:driver_app/widgets/home/searching.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/font-styles.dart';
import '../../widgets/common/full_width_green_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOnDuty = false;
  bool isSearching = false;
  bool showContainer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                isOnDuty ? Image.asset('assets/images/sos.png') : SizedBox(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showContainer = !showContainer;
                    });
                  },
                  child: Icon(
                    showContainer ? Icons.close : Icons.menu,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ],
            ),
            if (showContainer) Menu(),
            SizedBox(height: 20), // Adjust as needed for other content spacing
            if (isSearching)
              FutureDelayedReplacement(
                delay: Duration(seconds: 3),
                replacement: OrderFound(),
                child: Expanded(
                  child: Center(
                    child: Searching(),
                  ),
                ),
              ),
            if (!showContainer &&
                !isSearching) // Placeholder to maintain layout
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/noorder.png',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'No orders! Start duty to\nget new orders',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    FullWidthGreenButton(
                      label: 'START DUTY',
                      onPressed: () {
                        setState(() {
                          isSearching = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class FutureDelayedReplacement extends StatefulWidget {
  final Duration delay;
  final Widget child;
  final Widget replacement;

  const FutureDelayedReplacement({
    Key? key,
    required this.delay,
    required this.child,
    required this.replacement,
  }) : super(key: key);

  @override
  _FutureDelayedReplacementState createState() =>
      _FutureDelayedReplacementState();
}

class _FutureDelayedReplacementState extends State<FutureDelayedReplacement> {
  bool _showReplacement = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() {
          _showReplacement = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showReplacement ? widget.replacement : widget.child;
  }
}
