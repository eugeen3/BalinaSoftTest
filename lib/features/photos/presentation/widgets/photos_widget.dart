import 'package:balinasoft_test/core/constants/localization_constants.dart';
import 'package:balinasoft_test/core/ui/snackbar.dart';
import 'package:balinasoft_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:balinasoft_test/features/photos/presentation/cubit/photos_cubit.dart';
import 'package:balinasoft_test/features/photos/presentation/widgets/photo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosWidget extends StatefulWidget {
  const PhotosWidget({Key? key}) : super(key: key);

  @override
  State<PhotosWidget> createState() => _PhotosWidgetState();
}

class _PhotosWidgetState extends State<PhotosWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<PhotosCubit>(context).getPhotos(
        BlocProvider.of<AuthCubit>(context).state.user!.token,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotosCubit, PhotosState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          showSnackbar(context, state.errorMessage ?? LocalizationConstants.errorUnknown);
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        } else if (!state.isLoading && state.photos.isNotEmpty) {
          return GridView.count(
            crossAxisCount: 3,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            crossAxisSpacing: 16,
            mainAxisSpacing: 20,
            children: state.photos.map((photo) => PhotoTile(photoModel: photo)).toList(),
          );
        } else {
          return Center(
            child: Text(
              LocalizationConstants.textNoImages,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          );
        }
      },
    );
  }
}
