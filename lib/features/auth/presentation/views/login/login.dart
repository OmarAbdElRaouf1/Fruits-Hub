import 'package:flutter/material.dart';
import 'package:fruits_market/core/widgets/custom_app_bar.dart';
import 'package:fruits_market/features/auth/presentation/views/login/widgets/login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  static const String routeName = 'Login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تسجيل الدخول'),
      body: LoginBody(),
    );
  }
}
