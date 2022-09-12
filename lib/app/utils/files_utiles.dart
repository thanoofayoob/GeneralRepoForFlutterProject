import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';

// import 'package:file_picker/file_picker.dart';
typedef FileSelectionCallBack = void Function(List<File>);

class FilesUtils {
  static Future<FilePickerResult?> pickFiles(List<String> allowedExtensions) async {
    return await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: allowedExtensions,
    );
  }

  static Future<File?> singleFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      return null;
      // User canceled the picker
    }
  }

  static Future<List<PlatformFile>?> multipleFilePicker({
    bool allowMultiple = true,
    required List<String> allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        withData: true,
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        allowMultiple: allowMultiple,
        onFileLoading: onFileLoading);

    if (result != null) {
      List<PlatformFile> files = result.files;
      // List<File> files = result.paths.map((path) => File(path!)).toList();

      return files;
    } else {
      return null;
      // User canceled the picker
    }
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  static Future<Uint8List> getScreenShotFromRepaintBoundary(GlobalKey key) async {
    dynamic boundary = key.currentContext!.findRenderObject();
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    return pngBytes;
  }

  static String fileTypeName(String extension) {
    String fileExtension = '';
    if (extension == "bmp" ||
        extension == "gif" ||
        extension == "jpeg" ||
        extension == "jpg" ||
        extension == "png" ||
        extension == "HEIC" ||
        extension == "HEIF") {
      fileExtension = "image";
    } else if (extension == "avi" ||
        extension == "flv" ||
        extension == "mkv" ||
        extension == "mp4" ||
        extension == "mpeg" ||
        extension == "webm" ||
        extension == "wmv" ||
        extension == "HEVC") {
      fileExtension = "video";
    }

    return fileExtension;
  }
}
