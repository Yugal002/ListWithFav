import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsPage extends StatefulWidget {
  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  var data;

  @override
  void initState() {
    super.initState();
    data = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          appBar: AppBar(
            title: Text('Details'),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  data.name,
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  data.email,
                  style: TextStyle(
                      color: Colors.purple.withOpacity(0.7),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data.body,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
