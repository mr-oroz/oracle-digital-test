import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/widgets/app_button.dart';
import 'package:oracle_digital/presentation/widgets/person_info_widget.dart';
import 'package:oracle_digital/resources/resources.dart';

class LoggetOutScreen extends StatelessWidget {
  const LoggetOutScreen({super.key});

  // главная страничка для логина или регистрация 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 20,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.homeImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: 204.w,
                      height: 54.h,
                      child: Image.asset(
                        AppImages.logo,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 16,
                    bottom: 20,
                    child: PersonInfoWidget(
                      avavar: 'https://www.figma.com/file/dGc0vRe3CabL6i25WY8GmW/image/30da3812ee3d04cc3dd2af8ac04a3e3610f84bff',
                      name: 'Pawel Czerwinski',
                      social: 'pawel_czerwinski',
                      color: AppColor.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                children: [
                  AppButton(
                    color: AppColor.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/login_screen');
                    },
                    text: 'LOG IN',
                    width: 167.0.w,
                  ),
                  SizedBox(width: 8.w),
                  AppButton(
                    color: AppColor.black,
                    onPressed: () {
                      Navigator.pushNamed(context, '/register_screen');
                    },
                    text: 'REGISTER',
                    width: 167.0.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
