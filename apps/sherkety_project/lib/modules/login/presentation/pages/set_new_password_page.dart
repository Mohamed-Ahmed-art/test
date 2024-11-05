import 'package:flutter/material.dart';
import 'package:sherkety/core/app_style/colors.dart';
import 'package:sherkety/modules/login/presentation/pages/password_change_success_page.dart';
import 'package:ui/widgets/custom_button.dart';

import '../../../register/presentation/pages/register_page.dart';

class SetNewPasswordPage extends StatefulWidget {
  const SetNewPasswordPage({super.key});

  @override
  State<SetNewPasswordPage> createState() => _SetNewPasswordPageState();
}

class _SetNewPasswordPageState extends State<SetNewPasswordPage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _hasUppercase = false;
  bool _hasLowercase = false;
  bool _hasDigit = false;
  bool _hasSpecialChar = false;
  bool _isLengthValid = false;
  bool _passwordsMatch = false;

  void _validatePassword(String password) {
    setState(() {
      _hasUppercase = password.contains(RegExp(r'[A-Z]'));
      _hasLowercase = password.contains(RegExp(r'[a-z]'));
      _hasDigit = password.contains(RegExp(r'[0-9]'));
      _hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      _isLengthValid = password.length >= 8;
      _passwordsMatch = password == _confirmPasswordController.text;
    });
  }

  void _validateConfirmPassword(String confirmPassword) {
    setState(() {
      _passwordsMatch = confirmPassword == _passwordController.text;
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "ادخل كلمة سر جديدة",
                style: TextStyle(
                  color: AppColors.greenColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'يجب أن تكون كلمة المرور جديدة ومختلفة عن كل كلمات المرور التي استخدمتها سابقًا',
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              PasswordField(
                controller: _passwordController,
                onChanged: _validatePassword,
                text: 'كلمة المرور',
              ),
              const SizedBox(height: 20),
              PasswordField(
                text: 'تأكيد كلمة المرور',
                controller: _confirmPasswordController,
                onChanged: _validateConfirmPassword,
              ),
              const SizedBox(height: 20),
              const Text('يجب أن تكون كلمة المرور:'),
              _buildValidationItem('بطول 8 أحرف على الأقل', _isLengthValid),
              _buildValidationItem(
                  'تحتوي على حرف واحد على الأقل بأحرف كبيرة', _hasUppercase),
              _buildValidationItem(
                  'تحتوي على حرف واحد على الأقل بأحرف صغيرة', _hasLowercase),
              _buildValidationItem(
                  'تحتوي على حرف خاص واحد على الأقل', _hasSpecialChar),
              _buildValidationItem('تحتوي على رقم واحد على الأقل', _hasDigit),
              _buildValidationItem('تطابق تأكيد كلمة السر', _passwordsMatch),
              const SizedBox(height: 20),
              CustomButton(
                text: 'حفظ',
                onTap: _isPasswordValid()
                    ? () {
                        _submitPassword();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PasswordChangeSuccessPage(),
                          ),
                        );
                      }
                    : null,
                backgroundColor: _isPasswordValid()
                    ? AppColors.lightBlueColor
                    : AppColors.greyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildValidationItem(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isValid ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }

  bool _isPasswordValid() {
    return _isLengthValid &&
        _hasUppercase &&
        _hasLowercase &&
        _hasDigit &&
        _hasSpecialChar &&
        _passwordsMatch;
  }

  void _submitPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم حفظ كلمة المرور بنجاح')),
    );
  }
}
