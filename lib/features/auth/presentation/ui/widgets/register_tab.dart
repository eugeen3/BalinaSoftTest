part of '../screens/auth_screen.dart';

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
              obscureText: true,
              decoration: const InputDecoration(
                hintText: LocalizationConstants.textFieldPassword,
              ),
              validator: BlocProvider.of<AuthCubit>(context).validatePassword,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: LocalizationConstants.textFieldConfirmPassword,
              ),
              validator: BlocProvider.of<AuthCubit>(context).validatePassword,
            ),
            const SizedBox(height: 20),
            AuthButton(
              text: LocalizationConstants.buttonRegister,
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).signUp(
                  _formKey.currentState!.validate(),
                  AuthDataModel(
                    login: _loginController.text,
                    password: _passwordController.text,
                    confirmPassword: _confirmPasswordController.text,
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
