import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_management_tool/app/core/utils/keys.dart';

class StorageService extends GetxService{
  late GetStorage _box;

  Future<StorageService> init() async {
    _box = GetStorage();
    await _box.write(taskKey, []);
    //?? Write data on your only if data is null
    //await _box.writeIfNull(taskKey, []);
    return this;
  }

  // ?? read our data from local storage
  // !! generic types are used if you stored the list of type data
  // then it returns the list of type data similar like
  // if you stored the string data then it returns the string data type.

  T read<T>(String key){
    return _box.read(key);
  }

  // ?? write our data from local storage
  void write(String key , dynamic value) async{
    await _box.write(key, value);
  }
}