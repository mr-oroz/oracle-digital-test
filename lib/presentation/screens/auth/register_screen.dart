import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/widgets/app_back_icon_widget.dart';
import 'package:oracle_digital/presentation/widgets/app_button.dart';
import 'package:oracle_digital/presentation/widgets/app_title.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSignUpSuccess) {
              // если успешно зарегистрировалься тогда направим страничку на sign_up_screen
              Navigator.pushNamed(context, '/sign_up_screen');
            }
            if (state is AuthSignUpError) {
              // если ощибка будет сообшим 
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Error')));
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                const AppTitle(title: 'Register'),
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
                          context.read<AuthBloc>().add(AuthSignUpEvent(
                              email: emailController.text,
                              password: passwordController.text));
                        },
                        text: 'NEXT',
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
