import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/bloc/person_bloc/person_bloc.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/theme/app_fonts.dart';
import 'package:oracle_digital/presentation/widgets/app_button.dart';
import 'package:oracle_digital/presentation/widgets/custom_circle_avatar.dart';
import 'package:oracle_digital/presentation/widgets/grid_view_widget.dart';
import 'package:oracle_digital/presentation/widgets/shimmer_widget.dart';
import 'package:oracle_digital/resources/resources.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  bool get wantKeepAlive => true; // Важно!
  @override
  void initState() {
    // при перехода на эту страницу получаем персон картины
    context.read<PersonBloc>().add(LoadImagesPersonEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(height: 32.h),
              const CustomCircleAvatator(
                width: 128,
                height: 128,
                image: AppImages.personAvatar,
              ),
              SizedBox(height: 32.h),
              Text(
                'Jane',
                style: AppFonts.w400s36fComfortaa,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                'San francisco, ca'.toUpperCase(),
                style: AppFonts.w900s13fRoboto,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              AppButton(
                color: AppColor.black,
                onPressed: () {},
                text: 'follow jane'.toUpperCase(),
                width: double.infinity,
              ),
              SizedBox(height: 16.h),
              AppButton(
                color: AppColor.white,
                onPressed: () {},
                text: 'message'.toUpperCase(),
                width: double.infinity,
              ),
              SizedBox(height: 32.h),
              BlocBuilder<PersonBloc, PersonState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: const [
                        ShimmerWidget(width: 167, height: 220),
                        ShimmerWidget(width: 167, height: 310),
                      ],
                    );
                  }
                  if (state.error != null) {
                    return const Center(
                      child: Text('error'),
                    );
                  }
                  if (state.images.isNotEmpty) {
                    return GridViewWidget(
                      list: state.images,
                      firstHeightThreshold: 4,
                      secondHeightThreshold: 6,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(height: 32.h),
              AppButton(
                color: AppColor.white,
                onPressed: () {},
                text: 'see more'.toUpperCase(),
                width: double.infinity,
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
