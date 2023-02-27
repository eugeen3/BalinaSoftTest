import 'dart:convert';

import 'package:balinasoft_test/core/constants/http_constants.dart';
import 'package:balinasoft_test/core/constants/localization_constants.dart';
import 'package:balinasoft_test/core/exception/exception.dart';
import 'package:balinasoft_test/features/photos/data/model/downloaded_photo_model.dart';
import 'package:balinasoft_test/features/photos/data/model/uploaded_photo_model.dart';
import 'package:http/http.dart' as http;

abstract class PhotosRemoteDataSource {
  Future<List<DownloadedPhotoModel>> getPhotos(String userToken, int page);
  Future<DownloadedPhotoModel> uploadPhoto(String userToken, UploadedPhotoModel uploadedPhotoModel);
  Future<void> deletePhoto(String userToken, DownloadedPhotoModel downloadedPhotoModel);
}

class PhotosRemoteDataSourceImpl extends PhotosRemoteDataSource {
  PhotosRemoteDataSourceImpl(this._httpClient);

  final http.Client _httpClient;

  static const String _endpoint = '/api/image';

  @override
  Future<List<DownloadedPhotoModel>> getPhotos(String userToken, int page) async {
    try {
      final Map<String, dynamic> query = {'page': page};
      final Map<String, String> headers = {'Access-Token': userToken};
      final uri = Uri.https(HttpConstants.baseURL, _endpoint, query);

      final response = await _httpClient.post(
        uri,
        headers: headers,
      );

      if (response.statusCode == HttpConstants.successHttpCode) {
        return DownloadedPhotoModel.fromList(jsonDecode(response.body));
      } else {
        final error = jsonDecode(response.body)['error'];
        throw ServerException(message: '${LocalizationConstants.errorGetPhotos}: $error');
      }
    } catch (e) {
      throw ServerException(message: 'PhotosRemoteDataSource getPhotos() exception: $e');
    }
  }

  @override
  Future<DownloadedPhotoModel> uploadPhoto(
      String userToken, UploadedPhotoModel uploadedPhotoModel) async {
    try {
      final uri = Uri.https(HttpConstants.baseURL, _endpoint);
      final Map<String, String> headers = {
        'Access-Token': 'application/json;charset=UTF-8',
        'accept': userToken,
        'Content-Type': 'application/json;charset=UTF-8',
      };

      final response = await _httpClient.post(
        uri,
        headers: headers,
        body: uploadedPhotoModel.toJson(),
      );

      if (response.statusCode == HttpConstants.successHttpCode) {
        return DownloadedPhotoModel.fromResponseJson(response.body);
      } else {
        final error = jsonDecode(response.body)['error'];
        throw ServerException(message: '${LocalizationConstants.errorUploadPhoto}: $error');
      }
    } catch (e) {
      throw ServerException(message: 'PhotosRemoteDataSource uploadPhoto() exception: $e');
    }
  }

  @override
  Future<void> deletePhoto(String userToken, DownloadedPhotoModel downloadedPhotoModel) async {
    try {
      final photoId = downloadedPhotoModel.id;
      final uri = Uri.https(HttpConstants.baseURL, '$_endpoint/$photoId');
      final Map<String, String> headers = {'Access-Token': userToken};

      final response = await _httpClient.post(
        uri,
        headers: headers,
      );

      if (response.statusCode == HttpConstants.successHttpCode) {
        return;
      } else {
        final error = jsonDecode(response.body)['error'];
        throw ServerException(message: '${LocalizationConstants.errorDeletePhoto}: $error');
      }
    } catch (e) {
      throw ServerException(message: 'PhotosRemoteDataSource deletePhoto() exception: $e');
    }
  }
}
