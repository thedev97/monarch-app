import 'dart:convert';
import 'package:get/get.dart';
import '../../core/commons.dart';
import '../../core/remote_url.dart';
import '../../core/values/strings.dart';
import 'package:http/http.dart' as http;
import '../../data/project/project.dart';

class ProjectListController extends GetxController {
  ProjectListModel? projectListModel;

  RxBool loading = false.obs;

  void allProject() async {
    loading.value = true;
    try {
      http.Response response = await http.get(Uri.tryParse(project_list_url)!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        projectListModel = ProjectListModel.fromJson(result);
      } else {
        Commons.errorSnackBar(failed, noProject);
      }
    } catch (e) {
      loading.value = false;
      Commons.errorSnackBar('Exception', e.toString());
    }
  }
}
