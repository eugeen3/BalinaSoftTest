import 'package:balinasoft_test/core/exception/exception.dart';
import 'package:balinasoft_test/features/photos/data/model/downloaded_photo_model.dart';
import 'package:balinasoft_test/features/photos/data/model/uploaded_photo_model.dart';
import 'package:dartz/dartz.dart';

abstract class PhotosRepository {
  Future<Either<ServerException, List<DownloadedPhotoModel>>> getPhotos(
    String userToken,
    int page,
  );
  Future<Either<ServerException, DownloadedPhotoModel>> uploadPhoto(
    String userToken,
    UploadedPhotoModel uploadedPhotoModel,
  );
  Future<Either<ServerException, void>> deletePhoto(
    String userToken,
    DownloadedPhotoModel downloadedPhotoModel,
  );
}
