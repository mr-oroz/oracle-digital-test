import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/widgets/app_back_icon_widget.dart';
import 'package:oracle_digital/presentation/widgets/app_button.dart';
import 'package:oracle_digital/presentation/widgets/app_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const AppBackIconWidget(),
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSignInSuccess) {
             // если успешно логинили тогда направим страничку на главнную страничку и сохраняем и повторном запуске приложение откроется гланую страничку механизм работает
            Navigator.pushNamed(context, '/main_navigation_screen');
          }
          if (state is AuthSignInError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('error')));
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                const AppTitle(title: 'Log in'),
                SizedBox(height: 32.h),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        cursorColor: AppColor.black,
                        decoration: const InputDecoration(hintText: 'Email'),
                      ),
                      SizedBox(height: 16.h),
                      TextFormField(
                        controller: passwordController,
                        cursorColor: AppColor.black,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(height: 16.h),
                      AppButton(
                        color: AppColor.black,
                        onPressed: () {
                          context.read<AuthBloc>().add(AuthSignInEvent(
                              email: emailController.text,
                              password: passwordController.text));
                        },
                        text: 'LOG IN',
                        width: double.infinity,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
