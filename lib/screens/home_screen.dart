import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stepping_stone_app/tabs/chatting_tab.dart';
import 'package:stepping_stone_app/tabs/home_tab.dart';
import 'package:stepping_stone_app/tabs/profile_tab.dart';
import 'package:stepping_stone_app/tabs/setting_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final _tabs = [
    HomeTab(),
    ChattingTab(),
    ProfileTab(),
    SettingTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        onTap: (value) {
          _index = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_rounded,
            ),
            label: "채팅",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin,
            ),
            label: "프로필",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: "설정",
          ),
        ],
      ),
      body: _tabs[_index],
    );
  }
}
