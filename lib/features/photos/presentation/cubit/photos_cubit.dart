import 'package:balinasoft_test/features/photos/data/model/downloaded_photo_model.dart';
import 'package:balinasoft_test/features/photos/domain/repository/photos_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit(this._photosRepository) : super(const PhotosState(photos: [], isLoading: false));

  final PhotosRepository _photosRepository;

  void getPhotos(String userToken) async {
    emit(state.copyWith(isLoading: true));
    final result = await _photosRepository.getPhotos(userToken, 0);
    emit(state.copyWith(isLoading: false));
    result.fold((exception) {
      debugPrint(exception.message);
      emit(state.copyWith(errorMessage: exception.message));
    }, (photos) {
      debugPrint(photos.toString());
      emit(state.copyWith(photos: photos));
    });
  }
}
