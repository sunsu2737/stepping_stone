import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isregister = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
          ),
          AnimatedContainer(
            curve: Curves.ease,
            duration: Duration(milliseconds: 500),
            width: 280.w,
            height: _isregister ? 355.h : 420.h ,
            margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 50.w, bottom: 50.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 7,
                  offset: Offset(0, 10), // changes position of shadow
                )
              ],
            ),
            child: _isregister ? RegisterTab() : LoginTab()
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _isregister = false;
                      setState(() {});
                    },
                    child: Text(
                      "로그인",
                      style: TextStyle(
                          fontSize: 21.sp,
                          color: !_isregister ? Colors.black : Colors.grey),
                    ),
                  ),
                  if (!_isregister)
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      width: 65.w,
                      height: 2.5.h,
                      color: Colors.amber,
                    ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _isregister = true;
                      setState(() {});
                    },
                    child: Text(
                      "회원가입",
                      style: TextStyle(
                          fontSize: 21.sp,
                          color: _isregister ? Colors.black : Colors.grey),
                    ),
                  ),
                  if (_isregister)
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      width: 85.w,
                      height: 2.5.h,
                      color: Colors.amber,
                    ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}

// Widget getLoginTab(BuildContext context){
//   return
// }

class LoginTab extends StatelessWidget {
  const LoginTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_sharp), labelText: "이메일"),
          ),
        ),
        SizedBox(height: 35.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.key_sharp), labelText: "비밀번호"),
          ),
        ),
        SizedBox(
          height: 30.h
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Color.fromARGB(0, 0, 0, 0),
              fixedSize: Size(505.w,42.h),
              ),
          child: Image.asset(
            'assets/login_logos/email_login.png',
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Container(
                height: 1.7.h,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text("또는"),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Container(height: 1.7.h, color: Colors.grey),
            ),
            SizedBox(
              width: 15.w,
            ),
          ],
        ),
        SizedBox(
          height: 18.h,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Color.fromARGB(0, 0, 0, 0),
              fixedSize: Size(505.w,42.h),
              ),
          child: Image.asset(
            'assets/login_logos/kakao_login.png',
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Image.asset(
            'assets/login_logos/google_login.png',
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Color.fromARGB(0, 0, 0, 0),
              fixedSize: Size(505.w,42.h),
              ),
        ),
      ],
    );
  }
}

class RegisterTab extends StatelessWidget {
  const RegisterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_sharp), labelText: "이메일"),
          ),
        ),
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.key_sharp), labelText: "비밀번호"),
          ),
        ),
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.key_sharp), labelText: "비밀번호 확인"),
          ),
        ),
        SizedBox(height: 35.h,),
        ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("가입하기",style: TextStyle(fontSize: 18.sp),),
              SizedBox(width: 8.w,),
              Icon(Icons.arrow_forward_rounded,),
            ],
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Color.fromARGB(0, 0, 0, 0)),
        ),
      ],
    );
  }
}
