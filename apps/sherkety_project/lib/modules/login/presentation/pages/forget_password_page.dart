import 'package:flutter/material.dart';
import 'package:ui/widgets/country_dropdown.dart';
import 'package:ui/widgets/custom_button.dart';
import 'package:ui/widgets/custom_text_field.dart';
import '../../../../core/app_style/colors.dart';
import 'create_password_page.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController phoneNumberController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String countryCode ='+20';

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
                  'نسيت كلمة السر؟',
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
                  'لا تقلق! يحدث هذا أحيانًا. من فضلك، أدخل رقم جوالك المرتبط بحسابك.',
                  style: TextStyle(
                    color: Color(0xff414346),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 68,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        hintText: 'رقم الهاتف...',
                        keyboardType: TextInputType.phone,
                        controller: phoneNumberController,
                        primaryColor:  Color(0xFF004EDE),
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
                              countryCode = country.code;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const TermsAndPrivacyAgreement(),
              const SizedBox(height: 24),
              CustomButton(
                text: 'التالي',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  CreatePasswordPage(
                        phoneNumber: phoneNumberController.text,
                        countryCode: countryCode,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تذكرت كلمه السر؟',
                    style: TextStyle(
                      color: Color(0xff2E3233),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'ادخل الآن!',
                    style: TextStyle(
                      color: Color(0xff4A42EB),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ));
  }
}

class TermsAndPrivacyAgreement extends StatelessWidget {
  const TermsAndPrivacyAgreement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          color: Color(0xff414346),
          fontSize: 16,
          letterSpacing: .5,
          fontWeight: FontWeight.w400,
        ),
        children: <TextSpan>[
          TextSpan(text: "لقد قرأت وفهمت "),
          TextSpan(
            text: "شروط الخدمة ",
            style: TextStyle(
              color: Color(0xff003d79),
              fontWeight: FontWeight.w800,
              fontSize: 16,
              letterSpacing: .5,
            ),
          ),
          TextSpan(text: "و "),
          TextSpan(
            text: "سياسة\n الخصوصية ",
            style: TextStyle(
              height: 1,
              color: Color(0xff003d79),
              fontWeight: FontWeight.w800,
              fontSize: 16,
              letterSpacing: .5,
            ),
          ),
          TextSpan(text: "وأوافق عليها."),
        ],
      ),
    );
  }
}
