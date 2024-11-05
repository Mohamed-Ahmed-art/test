import 'package:flutter/material.dart';
import 'package:ui/widgets/custom_button.dart';
import '../../../../core/app_style/colors.dart';

class CreatePasswordPage extends StatelessWidget {
  final String phoneNumber;
  final String countryCode;

  const CreatePasswordPage({
    super.key,
    required this.phoneNumber,
    required this.countryCode,
  });

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
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
            Row(
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
                Text(
                  textDirection: TextDirection.ltr,
                  '$countryCode${formatPhoneNumber(phoneNumber)} ',
                  style: const TextStyle(
                    color: Color(0xff414346),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              text: 'اكد الرمز',
              onTap: () {},
            ),
            const SizedBox(height: 24),
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
