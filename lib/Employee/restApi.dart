import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RestApi {
  static const String BASE_URL = 'http://dummy.restapiexample.com/api/v1';
  static Future<List<dynamic>> getEmployees() async {
    // RESPONSE JSON :
    // [{
    //   "id": "1",
    //   "employee_name": "",
    //   "employee_salary": "0",
    //   "employee_age": "0",
    //   "profile_image": ""
    // }]
    final response = await http.get('${BASE_URL}/employees');
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      print(res);
      return res;
    } else {
      return null;
    }
  }

  static Future<bool> addEmployee(body) async {
    print(body);
    // BODY
    // {
    //   "name": "test",
    //   "age": "23"
    // }
    final response = await http.post('${BASE_URL}/create', body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
