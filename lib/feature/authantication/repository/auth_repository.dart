import 'dart:convert';
import 'package:http/http.dart' as http;
class AuthRepository{
  List<dynamic> users = [];
  Future<dynamic> fetchUser() async {
    print('fetchData called');
    const url = 'https://crm-beta-api.vozlead.in/api/v2/account/login/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    // setState(() {
    //   users = json['results'];
    // });
    print('fetch complited');
  }
getlog(){

}
}