import 'dart:convert';

import '../../Model/api_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static ApiHelper apiHelper = ApiHelper._();

  Future<ApiModel?> SingleResponceApi() async {
    http.Response response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/21"),
    );
    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);
      ApiModel data = ApiModel.formJSON(data: decodedData);
      return data;
    } else {
      return null;
    }
  }
}
