import 'package:balinasoft_test/features/photos/data/model/downloaded_photo_model.dart';
import 'package:flutter/material.dart';

class PhotoTile extends StatelessWidget {
  const PhotoTile({
    required this.photoModel,
    super.key,
  });

  final DownloadedPhotoModel photoModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              photoModel.url,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(_formatDate(photoModel.date)),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}.${date.month}.${date.year}';
  }
}
