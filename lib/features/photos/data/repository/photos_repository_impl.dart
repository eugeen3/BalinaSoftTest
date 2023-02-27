import 'package:balinasoft_test/core/exception/exception.dart';
import 'package:balinasoft_test/features/photos/data/datasource/photos_local_datasource.dart';
import 'package:balinasoft_test/features/photos/data/datasource/photos_remote_datasource.dart';
import 'package:balinasoft_test/features/photos/data/model/downloaded_photo_model.dart';
import 'package:balinasoft_test/features/photos/data/model/uploaded_photo_model.dart';
import 'package:balinasoft_test/features/photos/domain/repository/photos_repository.dart';
import 'package:dartz/dartz.dart';

class PhotosRepositoryImpl extends PhotosRepository {
  PhotosRepositoryImpl(this._photosRemoteDataSource, this._photosLocalDataSource);

  final PhotosRemoteDataSource _photosRemoteDataSource;
  // ignore: unused_field
  final PhotosLocalDataSource _photosLocalDataSource;

  @override
  Future<Either<ServerException, List<DownloadedPhotoModel>>> getPhotos(
    String userToken,
    int page,
  ) async {
    try {
      final List<DownloadedPhotoModel> photos =
          await _photosRemoteDataSource.getPhotos(userToken, page);
      return Right(photos);
    } on ServerException catch (e) {
      return Left(ServerException(message: e.message));
    }
  }

  @override
  Future<Either<ServerException, DownloadedPhotoModel>> uploadPhoto(
    String userToken,
    UploadedPhotoModel uploadedPhotoModel,
  ) async {
    try {
      final DownloadedPhotoModel photo =
          await _photosRemoteDataSource.uploadPhoto(userToken, uploadedPhotoModel);
      return Right(photo);
    } on ServerException catch (e) {
      return Left(ServerException(message: e.message));
    }
  }

  @override
  Future<Either<ServerException, void>> deletePhoto(
    String userToken,
    DownloadedPhotoModel downloadedPhotoModel,
  ) async {
    try {
      await _photosRemoteDataSource.deletePhoto(userToken, downloadedPhotoModel);
      return Right(Future.value(null));
    } on ServerException catch (e) {
      return Left(ServerException(message: e.message));
    }
  }
}
