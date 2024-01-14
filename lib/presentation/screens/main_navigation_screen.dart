import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oracle_digital/presentation/screens/chat_screen/chat_screen.dart';
import 'package:oracle_digital/presentation/screens/home_screen/home_screen.dart';
import 'package:oracle_digital/presentation/screens/person_screen/person_screen.dart';
import 'package:oracle_digital/presentation/screens/search_screen/search_screen.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/widgets/add_button_widget.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(key: ValueKey(1),),
    const SearchScreen(key: ValueKey(2),),
    const ChatScreen(key: ValueKey(3),),
    const PersonScreen(key: ValueKey(4),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x4C000000),
              blurRadius: 0,
              offset: Offset(0, -0.50),
              spreadRadius: 0,
            )
          ],
        ),
        child: BottomAppBar(
          color: AppColor.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  splashRadius: 22,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  icon: SvgPicture.asset('assets/svgs/home.svg'),
                ),
                IconButton(
                  splashRadius: 22,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  icon: SvgPicture.asset('assets/svgs/search.svg'),
                ),
                const AddButtonWidget(),
                IconButton(
                  splashRadius: 22,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  icon: SvgPicture.asset('assets/svgs/chat.svg'),
                ),
                IconButton(
                  splashRadius: 22,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                  icon: SvgPicture.asset('assets/svgs/person.svg'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


