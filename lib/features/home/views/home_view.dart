import 'package:bloc_statemanagement/core/functions/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import '../../../../core/api/api_key.dart';
import '../../../../core/helper/cache/cache_helper.dart';
import '../../../../core/functions/custom_navigation.dart';
import '../../../core/theme/app_colors.dart';
import '../../Auth/Login/views/login_view.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  Future<void> logout(BuildContext context) async {
    await CacheHelper().removeData(key: ApiKeys.token);
    await CacheHelper().removeData(key: ApiKeys.isLogged);
    await CacheHelper().removeData(key: "refresh_token");

    if (!context.mounted) return;
    customPushReplacement(context, const LoginView());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            logout(context);
            customSnackBar(context: context, message: "تم تسجيل الخروج بنجاح", color: AppColors.primaryDark);
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}