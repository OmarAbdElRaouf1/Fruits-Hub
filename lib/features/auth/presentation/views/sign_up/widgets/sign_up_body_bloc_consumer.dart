import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_market/features/auth/presentation/cubits/cubit/signup_cubit.dart';
import 'package:fruits_market/features/auth/presentation/views/sign_up/widgets/sign_up_body.dart';

class SignUpBodyBlocConsumer extends StatelessWidget {
  const SignUpBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        // Handle state changes if needed
      },
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        return SignUpBody();
      },
    );
  }
}
