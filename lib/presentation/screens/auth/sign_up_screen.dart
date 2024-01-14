import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/widgets/app_back_icon_widget.dart';
import 'package:oracle_digital/presentation/widgets/app_button.dart';
import 'package:oracle_digital/presentation/widgets/app_title.dart';
import 'package:oracle_digital/presentation/widgets/custom_rich_text.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();

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
            if (state is CreateDetailUserSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login_screen', (Route<dynamic> route) => false);
            }
            if (state is CreateDetailUserError) {
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
                        controller: usernameController,
                        cursorColor: AppColor.black,
                        decoration: const InputDecoration(
                          hintText: 'Login',
                        ),
                      ),
                      SizedBox(height: 16.h),
                      AppButton(
                        color: AppColor.black,
                        onPressed: () {
                          context.read<AuthBloc>().add(CreateDetailUserEvent(
                              username: usernameController.text));
                        },
                        text: 'SIGN UP',
                        width: double.infinity,
                      ),
                      SizedBox(height: 32.h),
                      const CustomRichText()
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
