import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_with_fav/controller/user_controller.dart';
import 'package:list_with_fav/models/user_data.dart';
import 'package:list_with_fav/pages/item_details_page.dart';
import 'package:list_with_fav/preferenceManager/pref_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserController userController = Get.put(UserController());
  var favColor = Colors.pink;
  var FAV_KEY = "FAV_KEY";
  List<String> favList = [];
  var favData = [];

  @override
  void initState() {
    super.initState();
    prefData();
  }

  void prefData() async {
    favData = await PreferenceManager().getListFromPref(FAV_KEY);
    if (favData != null) {
      favList = favData;
    }
    print(favList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List with fav'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            if (userController.isLoading.value)
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.purple,
              ));
            else
              return Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: userController.userList.value.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    UserData data = new UserData();
                    data = userController.userList.value[index];

                    print(favList);

                    String idStr = data.id.toString();

                    for (int i = 0; i < favList.length; i++) {
                      if (idStr == favList[i]) {
                        data.isFavourite = true;
                      }
                    }

                    print(data.isFavourite);

                    return Card(
                      elevation: 3,
                      child: ListTile(
                        leading:
                            Icon(Icons.person, color: Colors.purple, size: 25),
                        title: Text(data.name,
                            style: TextStyle(color: Colors.black)),
                        subtitle: Text(data.email,
                            style: TextStyle(color: Colors.black38)),
                        trailing: new IconButton(
                          icon: new Icon(
                            data.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: data.isFavourite ? favColor : Colors.grey,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              if (data.isFavourite == false) {
                                data.isFavourite = true;
                                favList.add(data.id.toString());

                                PreferenceManager()
                                    .addListToPref(FAV_KEY, favList);
                              } else {
                                data.isFavourite = false;

                                //favList.remove(index);
                                favList.removeWhere(
                                    (item) => item == data.id.toString());

                                PreferenceManager()
                                    .addListToPref(FAV_KEY, favList);
                                print(favList);
                              }
                            });
                          },
                        ),
                        onTap: () {
                          Get.to(ItemDetailsPage(), arguments: data);
                        },
                      ),
                    );
                  },
                ),
              );
          }),
        ),
      ),
    );
  }
}
