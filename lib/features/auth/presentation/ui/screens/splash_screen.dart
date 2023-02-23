import 'package:balinasoft_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleAppStart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Image.asset('assets/splash.png'),
        ),
      ),
    );
  }

  void _handleAppStart() {
    Future.delayed(const Duration(seconds: 3), () {
      final isNeedToAuth = BlocProvider.of<AuthCubit>(context).isNeedToAuth();
      Navigator.of(context).pushReplacementNamed(isNeedToAuth ? '/auth' : '/photos');
    });
  }
}
