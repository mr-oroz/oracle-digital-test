import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/theme/app_fonts.dart';
import 'package:oracle_digital/presentation/widgets/app_button.dart';
import 'package:oracle_digital/presentation/widgets/app_title.dart';
import 'package:oracle_digital/presentation/widgets/grid_view_widget.dart';
import 'package:oracle_digital/presentation/widgets/shimmer_widget.dart';
import 'package:oracle_digital/presentation/widgets/swiper_horizontal_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   bool get wantKeepAlive => true; // Важно!
  @override
  void initState() {

    // запуск при рендера получаем  What’s new today' and browse all данных с сервера
    super.initState();
    context.read<NewsBloc>().add(LoadNewTodayEvent());
    context.read<NewsBloc>().add(LoadAllEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
             //  refresh запуска получаем  What’s new today' and browse all данных с сервера
            context.read<NewsBloc>().add(LoadNewTodayEvent());
            context.read<NewsBloc>().add(LoadAllEvent());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(height: 32.h),
                const AppTitle(title: 'Discover'),
                SizedBox(height: 32.h),
                Text(
                  'What’s new today'.toUpperCase(),
                  style: AppFonts.w900s13fRoboto,
                ),
                SizedBox(height: 24.h),
                BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const ShimmerWidget(
                        width: 343,
                        height: 343,
                      );
                    }
                    if (state.error != null) {
                      return const Center(
                        child: Text('error'),
                      );
                    }
                    if (state.newTodayList.isNotEmpty) {
                      return SwiperHorizontalWidget(list: state.newTodayList);
                    } else {
                      return Container();
                    }
                  },
                ),
                SizedBox(height: 48.h),
                Text(
                  'Browse all'.toUpperCase(),
                  style: AppFonts.w900s13fRoboto.copyWith(),
                ),
                SizedBox(height: 24.h),
                BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state.isLoadingAll) {
                      return GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: const [
                          ShimmerWidget(width: 167, height: 220),
                          ShimmerWidget(width: 167, height: 310),
                        ],
                      );
                    }
                    if (state.errorAll != null) {
                      return const Center(child: Text('error'));
                    }
                    if (state.getAll.isNotEmpty) {
                      return GridViewWidget(
                        list: state.getAll,
                        firstHeightThreshold: 3,
                        secondHeightThreshold: 5,
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
                  text: 'SEE MORE',
                  width: double.infinity,
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
