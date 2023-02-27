import 'package:balinasoft_test/core/constants/localization_constants.dart';
import 'package:balinasoft_test/core/injection/service_locator.dart';
import 'package:balinasoft_test/core/ui/snackbar.dart';
import 'package:balinasoft_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:balinasoft_test/features/map/presentation/widgets/map_widget.dart';
import 'package:balinasoft_test/features/photos/presentation/cubit/photos_cubit.dart';
import 'package:balinasoft_test/features/photos/presentation/widgets/photos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum _Pages {
  photos,
  map,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _Pages currentPage = _Pages.photos;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<AuthCubit>(context)
          .mockAuth('yCSpvdNYHtZjB7zxBu5TtlDOXrig8VpZq5OJqEuy5UYplpUD28murKqBJVN2NtlA');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PhotosCubit>(
          create: (context) => sl<PhotosCubit>(),
        ),
      ],
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            showSnackbar(context, state.errorMessage ?? LocalizationConstants.errorUnknown);
          }
        },
        builder: (context, state) {
          return state.user == null
              ? const SizedBox.shrink()
              : Scaffold(
                  appBar: AppBar(),
                  body: _getBody(),
                  floatingActionButton: FloatingActionButton(onPressed: () {}),
                  drawer: Drawer(
                    child: ListView(children: [
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        padding: const EdgeInsets.only(left: 16, bottom: 16),
                        child: Column(
                          children: [
                            const Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.user?.login ?? '',
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.account_circle_rounded),
                        title: const Text(LocalizationConstants.drawerPhotos),
                        onTap: () => _changePage(_Pages.photos),
                      ),
                      ListTile(
                        leading: const Icon(Icons.place),
                        title: const Text(LocalizationConstants.drawerMap),
                        onTap: () => _changePage(_Pages.map),
                      ),
                    ]),
                  ),
                );
        },
      ),
    );
  }

  Widget? _getBody() {
    switch (currentPage) {
      case _Pages.photos:
        return const PhotosWidget();
      case _Pages.map:
        return const MapWidget();
      default:
        return null;
    }
  }

  void _changePage(_Pages page) {
    setState(() {
      switch (page) {
        case _Pages.photos:
          currentPage = _Pages.photos;
          break;
        case _Pages.map:
          currentPage = _Pages.map;
          break;
      }
    });
    Navigator.pop(context);
  }
}
