import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sherkety/core/app_style/colors.dart';
import 'package:sherkety/modules/login/presentation/pages/set_new_password_page.dart';
import 'package:sherkety/modules/register/presentation/pages/password_change_success_page.dart';
import 'package:ui/widgets/country_dropdown.dart';
import 'package:ui/widgets/custom_button.dart';
import 'package:ui/widgets/custom_text_field.dart';

class OtpVerificationPage extends StatefulWidget {
  final String? phoneNumber;
  final String? countryCode;
  const OtpVerificationPage({super.key, this.phoneNumber, this.countryCode});

  @override
  State<StatefulWidget> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final _otpControllers = List.generate(4, (index) => TextEditingController());
  Timer? _timer;
  int _secondsRemaining = 49;
  bool _isResendButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isResendButtonEnabled = true;
        });
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _otpControllers.forEach((controller) => controller.dispose());
    _timer?.cancel();
    super.dispose();
  }

  void _onOtpFieldChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      FocusScope.of(context).nextFocus();
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  void _resendCode() {
    setState(() {
      _secondsRemaining = 49;
      _isResendButtonEnabled = false;
    });
    _startCountdown();
    // Logic for resending the code goes here.
  }

  void _verifyCode() {
    String otp = _otpControllers.map((controller) => controller.text).join();
    // Verify the OTP code here.
    if (otp.length == 4) {
      // Add your OTP verification logic here
      print("Verifying OTP: $otp");
    }
  }

  void _showChangePhoneDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController phoneController = TextEditingController();
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'تغيير رقم هاتفك',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              //! PhoneNumber
              SizedBox(
                height: 68,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: CustomTextField(
                        hintText: 'رقم الهاتف...',
                        keyboardType: TextInputType.phone,
                        // controller: phoneNumberController,
                        primaryColor: Color(0xFF004EDE),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xffF0F1F5),
                          ),
                        ),
                        child: Center(
                          child: CountryDropdown(
                            onCountryChanged: (country) {
                              // countryCode = country.code;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'تغيير رقم الهاتف',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: AppColors.darkBlueColor,
                      ),
                    ),
                    child: const Text(
                      'إلغاء',
                      style: TextStyle(
                        color: AppColors.darkBlueColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Color(0xff4A42EB),
          ),
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 28),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'أدخل الرمز',
                style: TextStyle(
                  color: AppColors.greenColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'أرسلنا رمزًا مكونًا من 4 أرقام ',
                style: TextStyle(
                  color: Color(0xff414346),
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  textDirection: TextDirection.ltr,
                  'إلى الرقم المنتهي',
                  style: TextStyle(
                    color: Color(0xff414346),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textDirection: TextDirection.ltr,
                      '${widget.countryCode}${formatPhoneNumber(widget.phoneNumber ?? '123134')} ',
                      style: const TextStyle(
                        color: Color(0xff414346),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: _showChangePhoneDialog,
                      child: Container(
                        width: 95,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'تعديل الرقم',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) {
                  return SizedBox(
                    width: 85,
                    height: 56,
                    child: TextField(
                      controller: _otpControllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      cursorColor: AppColors.darkBlueColor,
                      maxLength: 1,
                      decoration: const InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: AppColors.darkBlueColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: AppColors.darkBlueColor,
                          ),
                        ),
                      ),
                      onChanged: (value) => _onOtpFieldChanged(value, index),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            if (_isResendButtonEnabled)
              TextButton(
                onPressed: _resendCode,
                child: const Text('إعادة الإرسال'),
              )
            else
              Text(
                'إعادة الإرسال بعد $_secondsRemaining ثانية',
                style: const TextStyle(color: Colors.grey),
              ),
            const Spacer(),
            CustomButton(
              text: 'أكد الرمز',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SetNewPasswordPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length <= 3) {
      return phoneNumber.replaceAll(RegExp(r'\d'), '*');
    } else {
      String firstDigit = phoneNumber[0];
      String lastTwoDigits = phoneNumber.substring(phoneNumber.length - 2);
      String stars = '-' * (phoneNumber.length - 2 - 1);
      return '$firstDigit$stars$lastTwoDigits';
    }
  }
}
