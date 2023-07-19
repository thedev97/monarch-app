import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import '../../core/commons.dart';
import '../../core/remote_url.dart';
import '../../data/profile/user.dart';
import '../../core/values/strings.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class MyWorkSpaceController extends GetxController {
  UserModel? userModel;
  RxBool loading = false.obs;

  RxString imagePath = ''.obs;
  RxBool isImgPathSet = false.obs;

  File? pickedFile;
  ImagePicker picker = ImagePicker();

  void fetchUserDetails(int id) async {
    try {
      loading(true);
      http.Response response =
          await http.get(Uri.tryParse('$user_details_url/$id')!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        userModel = UserModel.fromJson(result);
      } else {
        Commons.errorSnackBar(failed, userDetailsFailed);
      }
    } catch (e) {
      Commons.errorSnackBar('Exception', e.toString());
    } finally {
      loading(false);
    }
  }

  void setImagePath(String path) {
    imagePath.value = path;
    isImgPathSet.value = true;
  }

    Future<void> getImage(ImageSource source) async {
      final pickedImage =
      await picker.pickImage(source: source, imageQuality: 100);
      if (pickedImage != null) {
        pickedFile = File(pickedImage.path);
        setImagePath(pickedFile!.path);
      } else {
        Commons.errorSnackBar(failed, noImgFailedMsg);
      }
    }

  void uploadProfileImg(String token) async {
    try {
      loading(true);
      Map<String, String> headers = {"Authorization": "Bearer $token"};
      var stream = new http.ByteStream(pickedFile!.openRead());
      stream.cast();
      var length = await pickedFile!.length();
      var uri = Uri.tryParse('$profile_upload_url')!;
      var request = new http.MultipartRequest('POST', uri);
      var multiPortFile = new http.MultipartFile('avatar', stream, length);
      request.files.add(multiPortFile);
      request.headers.addAll(headers);
      var response = await request.send();
      print(response.stream.toString());
      if (response.statusCode == 201) {
        Commons.successSnackBar(
            uploadProfileImgSuccess, uploadProfileImgSuccessMsg);
      } else {
        Commons.errorSnackBar(uploadUserImgFailed, uploadUserImgFailedMsg);
      }
    } catch (e) {
      Commons.errorSnackBar('Exception', e.toString());
    } finally {
      loading(false);
    }
  }
}
