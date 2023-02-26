part of '../screens/auth_screen.dart';

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
              obscureText: true,
              decoration: const InputDecoration(
                hintText: LocalizationConstants.textFieldPassword,
              ),
              validator: BlocProvider.of<AuthCubit>(context).validatePassword,
            ),
            const SizedBox(height: 20),
            AuthButton(
              text: LocalizationConstants.buttonLogin,
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).logIn(
                  _formKey.currentState!.validate(),
                  AuthDataModel(
                    login: _loginController.text,
                    password: _passwordController.text,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
