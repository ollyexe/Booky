import 'package:http/http.dart' as http;

class BaseClient{
  static const String baseUrl = "http://192.168.1.15:9999/servlet_war_exploded/";
  var client = http.Client();


  Future<dynamic> login(String login,String pass) async {
    var url= Uri.parse(baseUrl+"apiUtente?path=login&mail="+login+"&pass="+pass);
    var response = await client.get(url);

    if(response.statusCode==200){
      return response.body;
    }
    else{

    }
  }
}