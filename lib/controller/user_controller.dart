import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:list_with_fav/models/user_data.dart';
import 'package:list_with_fav/services/api_service.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userList = List<UserData>().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsersList();
  }


  Future<List<UserData>> fetchUsersList() async {
    try {
      isLoading(true);
      var list = await ApiServices.getListService();

      return userList.value = list;
    } finally {
      isLoading(false);
    }
  }
}
