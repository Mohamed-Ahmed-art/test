import 'package:flutter/material.dart';
import 'package:sherkety/core/app_style/colors.dart';
import 'package:ui/widgets/custom_button.dart';

class PasswordChangeSuccessPage extends StatelessWidget {
  const PasswordChangeSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                'تم التحديث',
                style: TextStyle(
                  fontSize: 24.0,
                  color: AppColors.greenColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'تم تغيير كلمة السر بنجاح',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.greenColor,
                ),
              ),
              SizedBox(height: 30),
              Icon(
                Icons.check_circle,
                size: 128,
                color: AppColors.greenColor,
              ),
              SizedBox(height: 30),
              Text(
                'يمكنك الآن الدخول باستخدام كلمة السر الجديدة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              CustomButton(
                text: 'الدخول',
              )
            ],
          ),
        ),
      ),
    );
  }
}
