part of 'photos_cubit.dart';

class PhotosState extends Equatable {
  const PhotosState({
    required this.photos,
    this.errorMessage,
    required this.isLoading,
  });

  final List<DownloadedPhotoModel> photos;
  final String? errorMessage;
  final bool isLoading;

  PhotosState copyWith({
    List<DownloadedPhotoModel>? photos,
    String? errorMessage,
    bool? isLoading,
  }) {
    return PhotosState(
      photos: photos ?? this.photos,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [photos, errorMessage, isLoading];
}
