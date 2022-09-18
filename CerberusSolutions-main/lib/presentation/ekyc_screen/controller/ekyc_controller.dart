import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_compression/image_compression_io.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/models/xacthuc_model.dart';
import '/core/app_export.dart';

class EkycController extends GetxController {
  // RxList<EkycModel> listItemList = <EkycModel>[].obs;
  RxList<String> titlesFace = <String>[].obs;

  RxList<String> titlesInfo = <String>[].obs;

  RxList<String> typesEKYC = <String>[].obs;

  RxString selectedType = "idcard_type".tr.obs;

  String? _fileName;
  List<PlatformFile>? _paths;

  var pathFrontImage = "".obs;

  var pathBackImage = "".obs;

  var pathPortraitImage = "".obs;

  final extension = "".obs;

  final apiClient = ApiClient();

  var _ekycModel;

  var _errorMessage;

  final _isLoading = true.obs;

  final _isError = false.obs;

  bool get isLoading => _isLoading.value;

  bool get isError => _isError.value;

  XacThucModel get ekycModel => _ekycModel;

  String get errorMessage => _errorMessage;

  late List<CameraDescription> _cameras;
  CameraController? _cameraController;
  final RxBool _isInitialized = RxBool(false);
  CameraImage? _cameraImage;

  CameraController? get cameraController => _cameraController;
  bool get isInitialized => _isInitialized.value;

  @override
  void dispose() {
    _isInitialized.value = false;
    _cameraController!.dispose();
    super.dispose();
  }

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.bgra8888);
    _cameraController!.initialize().then((value) {
      _isInitialized.value = true;
      // _cameraController.startImageStream((image) => _cameraImage = image);
      // print(DateTime.now().microsecondsSinceEpoch)
      _isInitialized.refresh();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  XFile? image;
  String? img;
  var i = "".obs;
  var test = "".obs;
  get tests => test.value;
  get qrValue => i.value;
  final ImagePicker picker = ImagePicker();
  Future<void> pickImage(int id) async {
    final _pickedFile = await picker.getImage(source: ImageSource.gallery);
    print("huy");
    print(_pickedFile.runtimeType);
    print("hoang");
    //check if the image is not null
    if (_pickedFile != null) {
      image = XFile(_pickedFile.path);
      img = image?.path;
      i.value = img!;
      if (id == 0) {
        pathFrontImage.value = img!;
        debugPrint('_pathFrontImage - ${pathFrontImage.value}');
      } else if (id == 1) {
        pathBackImage.value = img!;
        debugPrint('_pathBackImage - $pathBackImage');
      } else if (id == 2) {
        pathPortraitImage.value = img!;
        debugPrint('_pathPortraitImage - $pathPortraitImage');
      }
    }
  }

  Future<void> captureWeb(XFile? im) async {
    //check if the image is not null
    img = im?.path;
    test.value = img!;
  }

  void pickFiles(int id) async {
    // _resetState();
    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: (extension.isNotEmpty)
            ? extension.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      e.toString();
    } catch (e) {
      e.toString();
    }
    print("huyhoang");
    print(_fileName.runtimeType);
    _fileName = _paths?.single.path;

    debugPrint('_fileName - ${_fileName!}');
    // debugPrint('_paths - $_paths');

    String? path = _fileName;

    debugPrint('path - $path');
    if (id == 0) {
      pathFrontImage.value = path!;
      debugPrint('_pathFrontImage - ${pathFrontImage.value}');
    } else if (id == 1) {
      pathBackImage.value = path!;
      debugPrint('_pathBackImage - $pathBackImage');
    } else if (id == 2) {
      pathPortraitImage.value = path!;
      debugPrint('_pathPortraitImage - $pathPortraitImage');
    }
  }

  @override
  void onInit() {
    initCamera();
    super.onInit();
    titlesFace.addAll([
      "lbl_liveness".tr,
      "lbl_face_matching".tr,
    ]);
    titlesInfo.addAll([
      "lbl_id_number".tr,
      "lbl_fullname".tr,
      "lbl_gender".tr,
      "lbl_nationality".tr,
      "lbl_birth_place".tr,
      "lbl_birthday".tr
    ]);
    typesEKYC.addAll([
      "idcard_type".tr,
      "passport_type".tr,
      "driver_lisence_type".tr,
      "other_documents_type".tr,
    ]);
  }

  @override
  void onClose() {
    super.onClose();
    pathFrontImage = "".obs;
    pathBackImage = "".obs;
    pathPortraitImage = "".obs;
  }

  void getEkycData(userId, company, frontPath, backPath, portraitPath) {
    debugPrint(
        'getEkycData before compress path: - $userId - $company - $frontPath - $backPath - $portraitPath');
    compressImage(frontPath).then((value) => frontPath = value);
    compressImage(backPath).then((value) => backPath = value);
    compressImage(portraitPath).then((value) => portraitPath = value);
    debugPrint(
        'getEkycData after compress path: - $userId - $company - $frontPath - $backPath - $portraitPath');
    print("getEkycData");
    _ekycModel = null;
    _errorMessage = null;
    _isError.value = _errorMessage != null;
    _isLoading.value = true;

    apiClient
        .getXacThucData(userId, company, frontPath, backPath, portraitPath)
        .then((xacThucModel) {
      _ekycModel = xacThucModel;

      debugPrint("_ekycModel - ${_ekycModel.toJson()}");
    }).catchError((err) {
      if (err is DioError) {
        switch (err.type) {
          case DioErrorType.response:
            _errorMessage = err.response?.statusMessage;
            break;
          default:
            _errorMessage = err.toString();
            break;
        }
      } else {
        _errorMessage = err.toString();
      }
      debugPrint("_errorMessage - $_errorMessage");
    }).whenComplete(() {
      _isError.value = _errorMessage != null;
      _isLoading.value = _ekycModel == null;
      debugPrint("_isLoading - ${_isLoading.value}");
      debugPrint("_isError - ${_isError.value}");
    });
  }

  Future<String> compressImage(String path) async {
    debugPrint('compressImage - $path');
    final file = File(path);
    final input = ImageFile(
      rawBytes: file.readAsBytesSync(),
      filePath: file.path,
      height: 512,
    );
    final output = await compressInQueue(ImageFileConfiguration(input: input));
    print('Input size = ${file.lengthSync()}');
    print('Output size = ${output.sizeInBytes}');
    return output.filePath;
  }
}
