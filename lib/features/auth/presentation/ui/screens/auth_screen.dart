import 'package:balinasoft_test/core/constants/localization_constants.dart';
import 'package:balinasoft_test/core/ui/snackbar.dart';
import 'package:balinasoft_test/features/auth/data/model/auth_data_model.dart';
import 'package:balinasoft_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:balinasoft_test/features/auth/presentation/ui/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widgets/login_tab.dart';
part '../widgets/register_tab.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            showSnackbar(context, state.errorMessage ?? LocalizationConstants.errorUnknown);
          }
        },
        builder: (context, state) {
          if (state.user != null) {
            Navigator.of(context).pushReplacementNamed('/home');
          }
          return Scaffold(
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
          );
        },
      ),
    );
  }
}
