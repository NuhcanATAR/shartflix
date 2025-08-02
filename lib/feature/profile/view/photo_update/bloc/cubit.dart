// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shartflix/feature/profile/view/photo_update/bloc/event.dart';
import 'package:shartflix/feature/profile/view/photo_update/bloc/state.dart';
import 'package:shartflix/product/core/helper/logger_package.dart';
import 'package:shartflix/product/core/service/end_point/end_point.dart';

class PhotoUpdateBloc extends Bloc<PhotoUpdateEvent, PhotoUpdateState> {
  final CustomLoggerPrint loggerPrint = CustomLoggerPrint();
  final ImagePicker picker = ImagePicker();
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  PhotoUpdateBloc() : super(PhotoUpdateInitial()) {
    on<PhotoPickImage>(_onPickImage);
    on<UploadPhoto>(_onUploadPhoto);
  }

  Future<File> _compressImage(File file) async {
    final dir = await getTemporaryDirectory();
    final targetPath = path.join(
      dir.path,
      'compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );

    final Uint8List? compressedBytes =
        await FlutterImageCompress.compressWithFile(
          file.absolute.path,
          quality: 60,
        );

    if (compressedBytes == null) {
      return file;
    }

    final compressedFile = await File(targetPath).writeAsBytes(compressedBytes);
    return compressedFile;
  }

  Future<void> _onPickImage(
    PhotoPickImage event,
    Emitter<PhotoUpdateState> emit,
  ) async {
    emit(PhotoPicking());

    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final File original = File(pickedFile.path);
        final File compressed = await _compressImage(original);
        emit(PhotoPicked(compressed));
      } else {
        emit(PhotoUpdateInitial());
      }
    } catch (e) {
      loggerPrint.printErrorLog(e.toString());
      emit(PhotoUpdateError());
    }
  }

  Future<void> _onUploadPhoto(
    UploadPhoto event,
    Emitter<PhotoUpdateState> emit,
  ) async {
    emit(PhotoUpdateLoading());
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'auth_token');
    try {
      final request = http.MultipartRequest(
        'POST',
        EndPoint.uriParse(EndPoint.userUploadPhotoEndPoint),
      );

      request.files.add(
        await http.MultipartFile.fromPath('file', event.fileImg.path),
      );

      request.headers['Authorization'] = 'Bearer $token';

      final response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        loggerPrint.printInfoLog(respStr);
        emit(PhotoUpdateSuccess());
      } else {
        loggerPrint.printErrorLog('Error: ${response.statusCode}');
        emit(PhotoUpdateError());
      }
    } catch (e) {
      loggerPrint.printErrorLog(e.toString());
      emit(PhotoUpdateError());
    }
  }
}
