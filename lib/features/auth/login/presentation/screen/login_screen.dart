import 'package:familybudgetmanager/core/widgets/app_text_field.dart';
import 'package:familybudgetmanager/core/widgets/submit_button.dart';
import 'package:familybudgetmanager/features/auth/login/presentation/cuibit/cubit.dart';
import 'package:familybudgetmanager/features/auth/login/presentation/cuibit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final supabase = Supabase.instance.client;
  final LocalAuthentication auth = LocalAuthentication();

  // @override
  // void initState() {
  //   super.initState();
  //   // _checkPreviousLogin();
  // }

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  // Future<void> _signInWithBiometricOnly() async {
  //   try {
  //     final isAuthenticated = await auth.authenticate(
  //       localizedReason: 'افتح التطبيق بالبصمة',
  //       options: const AuthenticationOptions(
  //         biometricOnly: true,
  //         stickyAuth: true,
  //       ),
  //     );

  //     if (!mounted) return;

  //     if (isAuthenticated) {
  //       Navigator.pushReplacementNamed(context, '/home');
  //     } else {
  //       ScaffoldMessenger.of(
  //         context,
  //       ).showSnackBar(const SnackBar(content: Text("فشل التحقق بالبصمة")));
  //     }
  //   } catch (e) {
  //     if (!mounted) return; // ✅ كمان هنا

  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text("خطأ بالبصمة: $e")));
  //   }
  // }

  // Future<void> _signInWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     final response = await supabase.auth.signInWithPassword(
  //       email: email,
  //       password: password,
  //     );

  //     if (response.user != null) {
  //       final prefs = await SharedPreferences.getInstance();
  //       final loggedInBefore = prefs.getBool('logged_in_before') ?? false;

  //       if (!loggedInBefore) {
  //         // أول مرة - شغل البصمة
  //         final isAuthenticated = await auth.authenticate(
  //           localizedReason: 'من فضلك فعّل البصمة لتسجيل الدخول',
  //           options: const AuthenticationOptions(
  //             biometricOnly: true,
  //             stickyAuth: true,
  //           ),
  //         );

  //         if (isAuthenticated) {
  //           await prefs.setBool('logged_in_before', true);
  //           Navigator.pushReplacementNamed(context, '/home');
  //         } else {
  //           ScaffoldMessenger.of(
  //             context,
  //           ).showSnackBar(const SnackBar(content: Text("فشل التحقق بالبصمة")));
  //         }
  //       } else {
  //         // المرات اللي بعد كدا - مفيش بصمة
  //         Navigator.pushReplacementNamed(context, '/home');
  //       }
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("بيانات الدخول غير صحيحة")),
  //       );
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text("خطأ: ${e.toString()}")));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is LoginError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Lottie.asset("assets/lottie/login.json"),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      AppTextFormFiled(
                        controller: emailController,

                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      AppTextFormFiled(
                        controller: passwordController,

                        labelText: "Password",
                        prefixIcon: Icon(Icons.password_sharp),
                        suffixIcon: IconButton(
                          icon: Icon(MaterialCommunityIcons.eye_off),
                          onPressed: () {},
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),

                      AppTextButton(
                        buttonWidth: MediaQuery.of(context).size.width * 0.8,
                        buttonText: "Login",
                        backgroundColor: Color(0xFF3F51B5),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        onPressed: () {
                          loginCubit.login(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          loginCubit.loginWithBiometricOnly();
                        },
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Lottie.asset(
                            "assets/lottie/faceid2.json",
                            width: 90,
                            height: 90,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
