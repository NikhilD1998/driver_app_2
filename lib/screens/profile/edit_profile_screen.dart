import 'package:driver_app/controller/delivery_boy_controller/delivery_boy_controller.dart';
import 'package:driver_app/controller/delivery_boy_controller/get_delivery_boy_by_id_model.dart';
import 'package:driver_app/widgets/common/custom_phone_field.dart';
import 'package:driver_app/widgets/common/custom_text_field.dart';
import 'package:driver_app/widgets/common/full_width_green_button.dart';
import 'package:driver_app/widgets/common/info_container.dart';
import 'package:driver_app/widgets/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.deliveryBoy});
  final DeliveryBoyModel deliveryBoy;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();
  final TextEditingController branchCodeController = TextEditingController();
  String userNumber = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with the existing data
    nameController.text = widget.deliveryBoy.name ?? "";
    emailController.text = widget.deliveryBoy.email ?? "";
    userNumber = widget.deliveryBoy.contact ?? "";
    phoneController.text = widget.deliveryBoy.contact!
            .substring(widget.deliveryBoy.contact!.length - 10) ??
        "";
    addressController.text = widget.deliveryBoy.city ?? "";
    accountNumberController.text =
        widget.deliveryBoy.bankDetails?.accountNumber ?? "";
    ifscCodeController.text = widget.deliveryBoy.bankDetails?.iFSCCode ?? "";
    branchCodeController.text =
        widget.deliveryBoy.bankDetails?.branchCode ?? "";
    dateOfBirthController.text = widget.deliveryBoy.dob ?? "";
  }

  Future<void> _selectDateOfBirth(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      final formattedDate =
          "${selectedDate.toIso8601String().split('T').first}";
      setState(() {
        dateOfBirthController.text = formattedDate;
      });
    }
  }

  void updateProfile() async {
    // Check if any of the fields are empty
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        addressController.text.isEmpty ||
        dateOfBirthController.text.isEmpty ||
        accountNumberController.text.isEmpty ||
        ifscCodeController.text.isEmpty ||
        branchCodeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
          backgroundColor: colorFailure, // Replace with your color
        ),
      );
      return;
    }

    // Check if phone number length is exactly 10 digits
    else if (phoneController.text.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Phone number must be exactly 10 digits.'),
          backgroundColor: colorFailure, // Replace with your color
        ),
      );
      return;
    } else {
      setState(() {
        isLoading = true;
      });
      final updateData = {
        "name": nameController.text,
        "email": emailController.text,
        "contact": userNumber,
        "city": addressController.text,
        "DOB": dateOfBirthController.text,
        "bankDetails": {
          "accountNumber": accountNumberController.text,
          "IFSCCode": ifscCodeController.text,
          "branchCode": branchCodeController.text,
        }
      };
      // Use the static method to update the delivery boy profile
      final result = await DeliveryBoyController.updateDeliveryBoyById(
        id: widget.deliveryBoy.id!,
        updateData: updateData,
        context: context,
      );

      result.fold(
        (String errorMessage) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: colorFailure,
            ),
          );
        },
        (String updatedDeliveryBoy) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Profile updated successfully!'),
              backgroundColor: colorSuccess,
            ),
          );
          Navigator.pop(context); // Go back to previous screen
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
              ),
              Text(
                'Edit Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Adjust font size if needed
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Colors.green, // Replace with your color
                    ),
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/images/avatarf.png'), // Placeholder image
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: 'NAME',
                  controller: nameController,
                ),
                SizedBox(height: 20),
                CustomPhoneField(
                  (number) {
                    setState(() {
                      userNumber = number;
                    });
                  },
                  controller: phoneController,
                  initialPhoneNumber: userNumber,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _selectDateOfBirth(context),
                  child: AbsorbPointer(
                    child: CustomTextField(
                      label: 'DATE OF BIRTH',
                      controller: dateOfBirthController,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: 'EMAIL',
                  controller: emailController,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: 'ADDRESS',
                  controller: addressController,
                ),
                SizedBox(height: 50),
                Text(
                  'BANK DETAILS',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: 'ACCOUNT NUMBER',
                  controller: accountNumberController,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: 'IFSC CODE',
                  controller: ifscCodeController,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: 'BANK BRANCH CODE',
                  controller: branchCodeController,
                ),
                SizedBox(height: 30),
                InfoContainer(
                  message:
                      'Your earnings will be transferred to this bank account every week.',
                ),
                SizedBox(height: 30),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                            color: Colors.green), // Replace with your color
                      )
                    : FullWidthGreenButton(
                        label: 'UPDATE PROFILE',
                        onPressed: updateProfile,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
