import 'package:flutter/material.dart';
import 'package:walpaper/Components/Helpers/api_helper.dart';
import 'package:walpaper/Model/api_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: FutureBuilder(
        future: ApiHelper.apiHelper.SingleResponceApi(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.hasError}"),
            );
          } else if (snapshot.hasData) {
            ApiModel? apidata = snapshot.data;
            return Card(
              child: ListTile(
                title: Text("${apidata!.title}"),
                subtitle: Text("${apidata.body}"),
                leading: Text("${apidata.id}"),
                trailing: Text("${apidata.userId}"),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
