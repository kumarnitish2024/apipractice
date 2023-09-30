import 'package:apipractice/single_controle/http_request_single_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleData extends StatefulWidget {
  const SingleData({super.key});

  @override
  State<SingleData> createState() => _SingleDataState();
}

class _SingleDataState extends State<SingleData> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: HttpsRequestControllers().getData(), 
        builder: (context, snapshot) {
        
        var data = snapshot.data;
        
        return ListView(
          children: [
            CircleAvatar(child: Image.network("${data?.image}")),
            Text("${data?.id}"),
            Text("${data?.name}"),
            Text("${data?.phoneNo}"),
            Text("${data?.emailId}"),
          ],
        );
        
      },)

    );
  }
}
