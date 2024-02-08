import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? ctrl;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Widget? prefixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final Function? validator;
  final FocusNode? focusNode;
  final Function? onFieldSubmitted;

  const AppTextFormField(
      {Key? key,
      this.ctrl,
      this.hintText,
      this.keyboardType,
      this.onFieldSubmitted,
      this.focusNode,
      this.validator,
      this.prefixIcon, this.textInputAction, this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: ctrl,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscuringCharacter: '*',
      obscureText: obscureText ?? false,
      focusNode: focusNode,
      onFieldSubmitted: (value) => onFieldSubmitted!(value),
      validator: (input) => validator!(input),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 21, vertical: 12).r,
        prefixIcon: prefixIcon,
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(1)),
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15.sp),
        labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
