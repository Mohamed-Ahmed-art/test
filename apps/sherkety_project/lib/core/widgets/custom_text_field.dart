// import 'package:flutter/material.dart';
// import '../app_style/colors.dart';
//
// class CustomTextField extends StatelessWidget {
//   final String hintText;
//   final String? Function(String?)? validator;
//   final void Function(String)? onChanged;
//   final void Function(String?)? onSaved;
//   final void Function(String)? onFieldSubmitted;
//   final TextEditingController? controller;
//   final TextInputType? keyboardType;
//   final bool? obscureText;
//   final AutovalidateMode? autovalidateMode;
//   final int? maxLines;
//
//   const CustomTextField({
//     super.key,
//     required this.hintText,
//     this.validator,
//     this.onChanged,
//     this.onFieldSubmitted,
//     this.controller,
//     this.keyboardType,
//     this.obscureText,
//     this.onSaved,
//     this.autovalidateMode,
//     this.maxLines = 1,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       autovalidateMode: autovalidateMode,
//       validator: validator,
//       onSaved: onSaved,
//       onChanged: onChanged,
//       onFieldSubmitted: onFieldSubmitted,
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText ?? false,
//       cursorColor: AppColors.lightBlueColor,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         hintText: hintText,
//         labelStyle: const TextStyle(color: Colors.white, fontSize: 14),
//         hintStyle: const TextStyle(
//             color: Color(0xFFAAADB1),
//             fontSize: 16,
//             fontWeight: FontWeight.w700),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(
//             color: Color(0xffD8DCE3),
//             width: 1.0,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(
//             color: Color(0xffD8DCE3),
//             width: 1.0,
//           ),
//         ),
//         focusedBorder: buildOutlineInputBorder(),
//         fillColor: Colors.transparent,
//         filled: true,
//       ),
//     );
//   }
//
//   OutlineInputBorder buildOutlineInputBorder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(
//         color: AppColors.lightBlueColor,
//         width: 1.0,
//       ),
//     );
//   }
// }
