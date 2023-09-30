import 'package:apipractice/controllers/http_request_controller.dart';
import 'package:apipractice/models/user_data_model.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  var httpController = HttpRequestController();

  TextEditingController nameController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: httpController.getUserDetails(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                List<UserDataModel> data = snapshot.data;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (cnt, index) {
                      return ListView(
                        shrinkWrap: true,
                        children: [
                          Text("${data[index].id}"),
                          Text("${data[index].name}"),
                          Text("${data[index].gender}"),
                          Text("${data[index].status}"),
                        ],
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "name"),
                  controller: nameController,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "status"),
                  controller: statusController,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "gender"),
                  controller: genderController,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "email"),
                  controller: emailController,
                ),
                ElevatedButton(
                    onPressed: () {
                      var data = UserDataModel(
                              id: 4729,
                              email: emailController.text,
                              gender: genderController.text,
                              name: nameController.text,
                              status: statusController.text)
                          .toJson();
                      httpController.addUserDetails(data).then((value) {
                        if (value == true) {
                          print("Data added");
                        } else {
                          print("data not added");
                        }
                      });
                    },
                    child: Text("POST"))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
