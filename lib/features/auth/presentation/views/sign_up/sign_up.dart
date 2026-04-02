import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_market/core/services/get_it.dart';
import 'package:fruits_market/core/widgets/cusotm_app_bar.dart';
import 'package:fruits_market/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_market/features/auth/presentation/cubits/cubit/signup_cubit.dart';
import 'package:fruits_market/features/auth/presentation/views/sign_up/widgets/sign_up_body_bloc_consumer.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  static const String routeName = 'SignUp';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(title: ' حساب جديد'),
        body: SignUpBodyBlocConsumer(),
      ),
    );
  }
}
