// import 'package:flutter/material.dart';
//
// class PhoneNumberRow extends StatelessWidget {
//   const PhoneNumberRow({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 68,
//       child: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: TextFormField(
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 hintText: 'رقم الهاتف...',
//                 hintStyle: TextStyle(
//                   color: Color(0xFFAAADB1),
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Color(0xffAAADB1))),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide(color: Color(0xff003D79)),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: 8),
//           Expanded(
//             child: Container(
//               height: 60,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(
//                   color: Color(0xffF0F1F5),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     '20+',
//                     style: TextStyle(
//                         fontSize: 24,
//                         color: Color(0xFF1F2122),
//                         fontWeight: FontWeight.w700),
//                   ),
//                   SizedBox(width: 11),
//                   Image.asset(
//                     'assets/images/flag.png',
//                     width: 24,
//                     height: 24,
//                   ),
//                 ],
//               ),
//
//               // child: CountryCodePicker(
//               //   onChanged: print,
//               //   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//               //   initialSelection: 'IT',
//               //   favorite: ['+39', 'FR'],
//               //   // optional. Shows only country name and flag
//               //   showCountryOnly: false,
//               //   // optional. Shows only country name and flag when popup is closed.
//               //   showOnlyCountryWhenClosed: false,
//               //   // optional. aligns the flag and the Text left
//               //   alignLeft: true,
//               // ),
//
//
//
//               // child: Directionality(
//               //   textDirection: TextDirection.ltr,
//               //   child: InternationalPhoneNumberInput(
//               //     onInputChanged: (PhoneNumber number) {
//               //       print(number.phoneNumber);
//               //     },
//               //     selectorConfig: SelectorConfig(
//               //       selectorType: PhoneInputSelectorType.DROPDOWN,
//               //       leadingPadding: 12,
//               //       trailingSpace: false,
//               //       showFlags: true,
//               //       setSelectorButtonAsPrefixIcon: false,
//               //     ),
//               //     ignoreBlank: false,
//               //     initialValue: PhoneNumber(isoCode: 'EG'),
//               //     inputDecoration: InputDecoration(
//               //       contentPadding: EdgeInsets.symmetric(vertical: 12),
//               //       border: OutlineInputBorder(
//               //         borderRadius: BorderRadius.circular(8),
//               //       ),
//               //     ),
//               //     textAlign: TextAlign.left,
//               //   ),
//               // ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   String generateCountryFlag() {
//     String countryCode = 'eg';
//
//     String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
//         (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
//
//     return flag;
//   }
// }
