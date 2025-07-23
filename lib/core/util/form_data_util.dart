import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';
import 'package:image/image.dart' as img;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class FormDataUtil {
  FormData getFormData({
    required List<Uint8List> imageDataList,
    required List<String> fileName,
  }) {
    final List<img.Image?> imageList = imageDataList
        .map(img.decodeImage)
        .toList();
    final List<Uint8List> pngBytesList = imageList
        .map((e) => Uint8List.fromList(img.encodePng(e!)))
        .toList();

    return _convertUint8ListToJpgFormData(
      imageDataList: pngBytesList,
      fileName: fileName,
    );
  }

  FormData _convertUint8ListToJpgFormData({
    required List<Uint8List> imageDataList,
    required List<String> fileName,
  }) {
    final List<MultipartFile> multipartFileList = imageDataList
        .asMap()
        .entries
        .map(
          (e) => MultipartFile.fromBytes(
            e.value,
            filename: '${fileName[e.key]}.png',
            contentType: MediaType('image', 'png'),
          ),
        )
        .toList();

    FormData formData = FormData.fromMap({
      'files': multipartFileList,
    });

    return formData;
  }
}
