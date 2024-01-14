import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/widgets/app_button.dart';
import 'package:oracle_digital/presentation/widgets/app_title.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool get wantKeepAlive => true; // Важно!
  Timer? _debounce;

  bool isActive = false;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      context.read<NewsBloc>().add(LoadSearchResultEvent(value: query));
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocListener<NewsBloc, NewsState>(
            listener: (context, state) {
              if (state.searchResult.isNotEmpty &&
                  state.searchResult.length == 12) {
                setState(() {
                  isActive = true;
                });
              } else {
                setState(() {
                  isActive = false;
                });
              }
            },
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 32.h),
                const AppTitle(title: 'Search'),
                SizedBox(height: 32.h),
                TextField(
                  onChanged: _onSearchChanged,
                  decoration:
                      const InputDecoration(hintText: 'Search all photos'),
                ),
                SizedBox(height: 32.h),
                BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state.isLoadingAll) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state.errorAll != null) {
                      return const Center(
                        child: Text('error'),
                      );
                    }
                    if (state.searchResult.isNotEmpty) {
                      return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 11,
                            crossAxisSpacing: 11,
                          ),
                          itemCount: state.searchResult.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 107.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        state.searchResult[index].image
                                            .toString(),
                                      ),
                                      fit: BoxFit.cover)),
                            );
                          });
                    } else {
                      return Container();
                    }
                  },
                ),
                SizedBox(height: 32.h),
                isActive
                    ? AppButton(
                        color: AppColor.white,
                        onPressed: () {},
                        text: 'see more'.toUpperCase(),
                        width: double.infinity)
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
