import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,required this.onChanged});
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged,
      style: TextStyle(
        color: ColorsManager.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        prefixIcon: Image.asset(AssetsManager.quran, color: ColorsManager.gold),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.gold),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.gold),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
