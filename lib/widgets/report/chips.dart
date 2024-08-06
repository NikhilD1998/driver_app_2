import 'package:driver_app/utils/colors.dart';
import 'package:flutter/material.dart';

class ChipRow extends StatefulWidget {
  @override
  _ChipRowState createState() => _ChipRowState();
}

class _ChipRowState extends State<ChipRow> {
  int _activeChipIndex = -1;

  void _toggleChip(int index) {
    setState(() {
      _activeChipIndex = (_activeChipIndex == index) ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildChip('Today', 0),
        SizedBox(width: 8),
        _buildChip('This week', 1),
        SizedBox(width: 8),
        _buildChip('This month', 2),
      ],
    );
  }

  Widget _buildChip(String label, int index) {
    bool isActive = _activeChipIndex == index;

    return ChoiceChip(
      showCheckmark: false,
      label: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : colorGreen,
          ),
        ),
      ),
      selected: isActive,
      onSelected: (_) => _toggleChip(index),
      selectedColor: colorGreen,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: colorGreen,
        ),
      ),
    );
  }
}
