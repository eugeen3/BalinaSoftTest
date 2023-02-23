import 'package:balinasoft_test/core/constants/localization_constants.dart';
import 'package:balinasoft_test/features/auth/data/models/auth_data_model.dart';
import 'package:balinasoft_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:balinasoft_test/features/auth/presentation/ui/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
              validator: BlocProvider.of<AuthCubit>(context).validateLogin,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: LocalizationConstants.textFieldPassword,
              ),
              validator: BlocProvider.of<AuthCubit>(context).validatePassword,
            ),
            const SizedBox(height: 20),
            AuthButton(
              text: LocalizationConstants.buttonLogin,
              onPressed: () => BlocProvider.of<AuthCubit>(context).logIn(
                _formKey.currentState!.validate(),
                AuthDataModel(
                  login: _loginController.text,
                  password: _passwordController.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterTab extends StatefulWidget {
  const RegisterTab({
    super.key,
  });

  @override
  State<RegisterTab> createState() => _RegisterTabState();
}

class _RegisterTabState extends State<RegisterTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
              validator: BlocProvider.of<AuthCubit>(context).validateLogin,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: LocalizationConstants.textFieldPassword,
              ),
              validator: BlocProvider.of<AuthCubit>(context).validatePassword,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                hintText: LocalizationConstants.textFieldConfirmPassword,
              ),
              validator: BlocProvider.of<AuthCubit>(context).validatePassword,
            ),
            const SizedBox(height: 20),
            AuthButton(
              text: LocalizationConstants.buttonRegister,
              onPressed: () => BlocProvider.of<AuthCubit>(context).logIn(
                _formKey.currentState!.validate(),
                AuthDataModel(
                  login: _loginController.text,
                  password: _passwordController.text,
                  confirmPassword: _confirmPasswordController.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
