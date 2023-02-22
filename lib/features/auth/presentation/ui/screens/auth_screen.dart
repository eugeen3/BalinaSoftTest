import 'package:balinasoft_test/core/constants/localization_constants.dart';
import 'package:balinasoft_test/core/injection/service_locator.dart';
import 'package:balinasoft_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:balinasoft_test/features/auth/presentation/ui/widgets/auth_button.dart';
import 'package:balinasoft_test/features/auth/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: LocalizationConstants.tabTitleLogin),
                Tab(text: LocalizationConstants.tabTitleRegister),
              ],
            ),
          ),
          body: const TabBarView(children: [
            LoginTab(),
            RegisterTab(),
          ]),
        ),
      ),
    );
  }
}

class LoginTab extends StatefulWidget {
  const LoginTab({
    super.key,
  });

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _loginController,
              decoration: const InputDecoration(
                hintText: LocalizationConstants.textFieldLogin,
              ),
              validator: AuthValidators.validateLogin,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: LocalizationConstants.textFieldPassword,
              ),
              validator: AuthValidators.validatePassword,
            ),
            const SizedBox(height: 20),
            AuthButton(
              text: LocalizationConstants.buttonLogin,
              onPressed: _logIn,
            ),
          ],
        ),
      ),
    );
  }

  void _logIn() {
    if (_formKey.currentState!.validate()) {
      print(_loginController.text);
    }
  }
}

class RegisterTab extends StatelessWidget {
  const RegisterTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey formKey = GlobalKey<FormState>();
    final TextEditingController loginController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: loginController,
              decoration: const InputDecoration(
                hintText: LocalizationConstants.textFieldLogin,
              ),
              validator: AuthValidators.validateLogin,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: LocalizationConstants.textFieldPassword,
              ),
              validator: AuthValidators.validatePassword,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                hintText: LocalizationConstants.textFieldConfirmPassword,
              ),
              validator: AuthValidators.validatePassword,
            ),
            const SizedBox(height: 20),
            AuthButton(
              text: LocalizationConstants.buttonRegister,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
