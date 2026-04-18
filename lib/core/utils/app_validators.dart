// ملف: lib/utils/validators.dart

class AppValidators {
  // --- دالة التحقق من الاسم (الأول والأخير) ---
  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    List<String> words = value.trim().split(RegExp(r'\s+'));
    if (words.length >= 2) {
      return null;
    } else {
      return 'الرجاء إدخال الاسم الأول والأخير';
    }
  }

  // --- دالة التحقق من كلمة المرور (بسيطة مع شرط إضافي) ---
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال كلمة المرور';
    }

    // 1. التحقق من الطول (6 أحرف على الأقل)
    if (value.length < 6) {
      return 'كلمة المرور يجب أن تتكون من 6 أحرف على الأقل';
    }
    // 2. التحقق من وجود حرف أبجدي واحد على الأقل (سواء كبير أو صغير)
    // هذا يمنع المستخدم من كتابة أرقام فقط مثل "123456"
    if (!value.contains(RegExp(r'[a-zA-Z]'))) {
      return 'يجب أن تحتوي كلمة المرور على حرف إنجليزي واحد على الأقل';
    }

    //  ملاحظة: إذا كنت تقصد بكلمة "char" إضافة رمز خاص (مثل @ أو #)،
    //   يمكنك تفعيل هذا الشرط بدلاً من الشرط السابق أو معه:

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'يجب أن تحتوي على رمز خاص واحد على الأقل';
    }

    return null; // الكلمة مقبولة
  }

  // --- دالة التحقق من البريد الإلكتروني ---
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    const emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    if (RegExp(emailPattern).hasMatch(value.trim())) {
      return null;
    } else {
      return 'الرجاء إدخال بريد إلكتروني صحيح';
    }
  }

  // --- دالة التحقق من رقم الهاتف (محمول أو أرضي مصري) ---
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    const mobilePattern = r'^01[0125][0-9]{8}$';
    const landlinePattern = r'^0[2-9][0-9]{7,8}$';

    if (RegExp(mobilePattern).hasMatch(value.trim()) ||
        RegExp(landlinePattern).hasMatch(value.trim())) {
      return null;
    } else {
      return ' الرجاء إدخال رقم هاتف محمول صحيح';
    }
  }

  static String? validateLandLineNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    const landlinePattern = r'^0[2-9][0-9]{7,8}$';

    if (RegExp(landlinePattern).hasMatch(value)) {
      return null;
    } else {
      return 'الرجاء إدخال رقم أرضي صحيح';
    }
  }

  // --- دالة التحقق من رمز التحقق (OTP) ---
  static String? validateOTP(String? value) {
    // 1. التحقق من أن الحقل ليس فارغاً
    if (value == null || value.trim().isEmpty) {
      return 'الرجاء إدخال رمز التحقق';
    }

    // 2. التحقق من أن الرمز يتكون من أرقام فقط وطوله محدد (مثلاً 6 أرقام)
    // إذا كان الـ OTP الخاص بك يتكون من 4 أرقام، قم بتغيير {6} إلى {4}
    if (!RegExp(r'^\d{6}$').hasMatch(value.trim())) {
      return 'رمز التحقق يجب أن يتكون من 6 أرقام فقط';
    }

    return null; // الإدخال صحيح
  }
}
