import 'package:driver_app/widgets/constants/colors.dart';
import 'package:driver_app/widgets/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

Widget CustomPhoneField(
  Function(String) onPhoneNumberChanged, {
  String? initialPhoneNumber,
  required TextEditingController controller,
  String? label, // Optional label parameter
}) {
  String? phoneNumber;
  String countryCode =
      '+91'; // Default country code if initialPhoneNumber is null

  if (initialPhoneNumber != null) {
    // Check if initialPhoneNumber starts with '+'
    if (initialPhoneNumber.startsWith('+')) {
      phoneNumber = initialPhoneNumber;
    } else {
      // Assume initialPhoneNumber is provided without '+', prepend '+'
      phoneNumber = '+' + initialPhoneNumber;
    }
  }

  controller.addListener(() {
    onPhoneNumberChanged(controller.text);
  });

  return Material(
    elevation: 3.0,
    color: Colors.white,
    borderRadius: BorderRadius.circular(7.0),
    child: IntlPhoneField(
      controller: controller,
      disableLengthCheck: true,
      keyboardType: TextInputType.phone,
      showDropdownIcon: false,
      flagsButtonPadding: EdgeInsets.symmetric(horizontal: 3.w),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        labelText: label?.toUpperCase(), // Use the optional label
        labelStyle: body4TextStyle.copyWith(color: textGrey2),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide(color: textGrey2, width: 0.1.h),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide(color: textGrey2, width: 0.1.h),
        ),
      ),
      dropdownTextStyle: TextStyle(
        color: textBlack,
        fontFamily: 'Poppins',
        fontSize: 13.sp,
      ),
      initialCountryCode: phoneNumber == null ? 'IN' : null,
      initialValue: phoneNumber ?? "",
      onCountryChanged: (country) {
        controller.text = '';
      },
      onChanged: (phone) {
        onPhoneNumberChanged(phone.completeNumber);
      },
    ),
  );
}
