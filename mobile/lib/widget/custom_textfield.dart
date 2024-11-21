import 'package:flutter/material.dart';
import 'package:project_tubes/login_screen/styles.dart';

class CustomTextfield extends StatelessWidget{
  const CustomTextfield({
    required this.controller, 
    required this.textInputType,
    required this.textInputAction,
    required this.hint,
    this.isObscure = false,
    this.hasSuffix = false,
    this.onPressed,
    super.key });

  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String hint;
  final bool isObscure;
  final bool hasSuffix;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyles.body,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: isObscure,
      decoration: InputDecoration(
        filled: true,// Mengaktifkan latar belakang
        fillColor: Colors.white, // Warna latar belakang putih
        suffixIcon: hasSuffix 
        ? IconButton(
            onPressed: onPressed, 
            icon: Icon(
              isObscure ? Icons.visibility : Icons.visibility_off,
            color: Colors.orange[600],
            ),
          ) 
        : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.darkGrey,
          ), 
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.darkGrey,
          ), 
          borderRadius: BorderRadius.circular(5),
        ),
        hintText: hint,
        hintStyle: TextStyles.body,
      ),
    );  
  }
}