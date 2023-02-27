import 'package:balinasoft_test/core/constants/localization_constants.dart';
import 'package:balinasoft_test/features/map/presentation/widgets/map_widget.dart';
import 'package:balinasoft_test/features/photos/presentation/widgets/photos_widget.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _getBody(),
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
                        'username',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 20,
                        ),
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
