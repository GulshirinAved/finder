// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:yitirdim/Theme/constants.dart';

// class TextFields extends StatelessWidget {
//   final bool isNumber;
//   final String hintText;
//   final int? maxLine;
//   bool? obscure;
//   IconData? icon;
//   VoidCallback? onTap;
//   IconData? prefixIcon;
//   Color? color;
//   String? prefixText;
//   TextEditingController controller;
//   double? topGap;
//   String? Function(String?) validator;
//   int maxLength;
//   int? number;

//   TextFields(
//       {super.key,
//       required this.isNumber,
//       required this.hintText,
//       this.maxLine,
//       this.obscure,
//       this.icon,
//       this.onTap,
//       this.prefixIcon,
//       this.color,
//       this.prefixText,
//       required this.controller,
//       this.topGap,
//       required this.validator,
//       required this.maxLength,
//       this.number});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(15).copyWith(top: topGap ?? 25, bottom: 0),
//       child: TextFormField(
//         maxLengthEnforcement: MaxLengthEnforcement.enforced,
//         inputFormatters: [
//           number == 1
//               ? LengthLimitingTextInputFormatter(8)
//               : LengthLimitingTextInputFormatter(15),
//         ],
//         controller: controller,
//         obscureText: obscure ?? false,
//         keyboardType: isNumber ? TextInputType.number : TextInputType.text,
//         maxLines: maxLine ?? 1,
//         enabled: true,
//         decoration: InputDecoration(
//             errorMaxLines: 2,
//             errorStyle: TextStyle(
//               fontFamily: 'Comfortaa-SemiBold',
//             ),
//             hintMaxLines: 5,
//             helperMaxLines: 5,
//             prefixIcon: prefixIcon != null
//                 ? Icon(prefixIcon)
//                 : Container(
//                     margin: EdgeInsets.all(8).copyWith(top: 15, left: 10),
//                     child: Text(
//                       '+993',
//                       style: TextStyle(
//                           fontFamily: 'Comfortaa-SemiBold',
//                           fontWeight: FontWeight.bold,
//                           fontSize: AppConstants().fontSize15,
//                           color: Theme.of(context).iconTheme.color),
//                     )),
//             prefixIconColor: Theme.of(context).iconTheme.color,
//             suffixIcon: IconButton(
//                 onPressed: onTap,
//                 icon: icon == null
//                     ? SizedBox()
//                     : Icon(
//                         icon,
//                         // color: color,
//                       )),
//             hintText: hintText,
//             hintStyle: TextStyle(
//               color: AppConstants().greyColor,
//               fontFamily: 'Comfortaa-SemiBold',
//             ),
//             contentPadding:
//                 EdgeInsets.only(left: 25, top: 20, bottom: 20, right: 10),
//             border: OutlineInputBorder(
//               borderRadius: AppConstants().borderRadius5,
//             ),
//             filled: true,
//             fillColor: color ?? AppConstants().greyColor1.withOpacity(0.4),
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: AppConstants().borderRadius5,
//                 borderSide: BorderSide(color: AppConstants().greyColor1)),
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: AppConstants().borderRadius5,
//                 borderSide: BorderSide(color: AppConstants().greyColor1)),
//             errorBorder: OutlineInputBorder(
//                 borderRadius: AppConstants().borderRadius10,
//                 borderSide:
//                     BorderSide(color: AppConstants().mainColor, width: 2))),
//         validator: validator,
//       ),
//     );
//   }
// }
