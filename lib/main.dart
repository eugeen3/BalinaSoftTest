import 'package:balinasoft_test/core/injection/service_locator.dart';
import 'package:balinasoft_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:balinasoft_test/features/auth/presentation/ui/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const MaterialColor myColor = MaterialColor(
    0xff8bc34a,
    <int, Color>{
      50: Color(0xff8bc34a),
      100: Color(0xff8bc34a),
      200: Color(0xff8bc34a),
      300: Color(0xff8bc34a),
      400: Color(0xff8bc34a),
      500: Color(0xff8bc34a),
      600: Color(0xff8bc34a),
      700: Color(0xff8bc34a),
      800: Color(0xff8bc34a),
      900: Color(0xff8bc34a),
    },
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: myColor,
          ).copyWith(secondary: Colors.white),
        ),
        home: const AuthScreen(),
        initialRoute: '/',
        routes: const {},
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
