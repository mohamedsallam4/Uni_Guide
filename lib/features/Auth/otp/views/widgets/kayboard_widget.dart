import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

Widget buildKeyboard({
  required Function(String) onNumberTap,
  required VoidCallback onDelete,
}) {
  List<String> numbers = [
    "1","2","3",
    "4","5","6",
    "7","8","9",
    "del","0"
  ];
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: numbers.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisExtent: 60,
    ),
    itemBuilder: (context, index) {
      final item = numbers[index];

      if (item == "del") {
        return IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.backspace_outlined),
        );
      }

      return GestureDetector(
        onTap: () => onNumberTap(item),
        child: Center(
          child: Text(
            item,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryDark,
            ),
          ),
        ),
      );
    },
  );
}