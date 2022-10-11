import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stepping_stone_app/models/auth_model.dart';
import 'package:stepping_stone_app/models/login_model.dart';
import 'package:stepping_stone_app/models/register_model.dart';

//TODO: 이메일인증 + 구글 카카오톡 로그인 구현
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isregister = false;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginFieldModel()),
        ChangeNotifierProvider(create: (_) => RegisterFieldModel())
      ],
      child: Scaffold(
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
                height: _isregister ? 420.h : 470.h,
                margin: EdgeInsets.only(
                    left: 20.h, right: 20.h, top: 50.w, bottom: 50.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 7,
                      offset: Offset(0, 10),
                    )
                  ],
                ),
                child: _isregister ? RegisterTab() : LoginTab()),
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
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

class LoginTab extends StatelessWidget {
  const LoginTab({super.key});

  @override
  Widget build(BuildContext context) {
    final loginField = Provider.of<LoginFieldModel>(context, listen: false);
    final authModel = Provider.of<FirebaseAuthProvider>(context);
    return Column(
      children: [
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: TextField(
            onChanged: (value) {
              loginField.setEmail(value);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_sharp), labelText: "이메일"),
          ),
        ),
        SizedBox(height: 35.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: TextField(
            obscureText: true,
            onChanged: (value) {
              loginField.setPassword(value);
            },
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.key_sharp), labelText: "비밀번호"),
          ),
        ),
        SizedBox(height: 30.h),
        ElevatedButton(
          onPressed: () {
            authModel
                .loginWithEmail(loginField.email, loginField.password)
                .then((loginState) {
              if (loginState == AuthStatus.loginSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text("로그인 성공")));
                Navigator.of(context).pushReplacementNamed('/home');
              } else {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text('로그인 실패')));
              }
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            fixedSize: Size(505.w, 42.h),
          ),
          child: Image.asset(
            'assets/login_logos/email_login.png',
          ),
        ),
        SizedBox(
          height: 30.h,
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
            elevation: 0,
            fixedSize: Size(505.w, 42.h),
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
            elevation: 0,
            fixedSize: Size(505.w, 42.h),
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
    final registerModel =
        Provider.of<RegisterFieldModel>(context, listen: false);
    final authModel = Provider.of<FirebaseAuthProvider>(context);
    return Column(
      children: [
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: TextField(
            onChanged: (value) {
              registerModel.setEmail(value);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_sharp), labelText: "이메일"),
          ),
        ),
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: TextField(
            obscureText: true,
            onChanged: (value) {
              registerModel.setPassword(value);
            },
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.key_sharp), labelText: "비밀번호"),
          ),
        ),
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: TextField(
            obscureText: true,
            onChanged: (value) {
              registerModel.setPasswordConfirm(value);
            },
            decoration: InputDecoration(
                errorText:
                    registerModel.password != registerModel.passwordConfirm
                        ? "비밀번호가 일치하지 않습니다."
                        : null,
                prefixIcon: Icon(Icons.key_sharp),
                labelText: "비밀번호 확인"),
          ),
        ),
        SizedBox(
          height: 35.h,
        ),
        ElevatedButton(
            onPressed: () {
              authModel
                  .registerWithEmail(
                      registerModel.email, registerModel.password)
                  .then((registerState) {
                if (registerState == AuthStatus.registerSuccess &&
                    registerModel.password == registerModel.passwordConfirm) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text("가입 완료")));
                  Navigator.of(context).pushReplacementNamed('/login');
                } else {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text("가입 실패, 다시 시도해주세요")));
                }
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "가입하기",
                  style: TextStyle(fontSize: 18.sp),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, elevation: 0)),
      ],
    );
  }
}
