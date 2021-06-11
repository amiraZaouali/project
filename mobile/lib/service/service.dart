import 'dart:convert';


import 'package:http/http.dart' as http;
class Services{
  final String serverUrl = "http://localhost:3000/api/";
  static Services _instance;
  factory Services() => _instance ??= new Services._();

  Services._();
  



  loginUser() async {
    var response = await http.post(Uri.parse(serverUrl + "user/login"));
    if(response.statusCode == 200){
      var result = jsonDecode(response.body);
      if(result['success'] == true){
        
      } 
    }
  }
}