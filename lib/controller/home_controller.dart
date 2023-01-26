import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/model/device.dart';

class HomeController{
  Future<List<Devices>> getDevicesList() async {
    // init package
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // get data login
    var userAuth = prefs.getString('user_auth');
    var data = json.decode(userAuth!); // diubah menjadi Map<String, dynamic>

    // akses security API
    String basicAuth = 'Basic ' +
        base64Encode(utf8.encode(data['email'] + ":" + data['password']));
    
    // request API
    final response = await http.get(Uri.parse("https://demo.traccar.org/api/devices"),
        headers: {'authorization': basicAuth});
    debugPrint(response.body);

    // Map<String, dynamic> to Devices
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Devices> device = items.map<Devices>((json) {
      return Devices.fromJson(json);
    }).toList();

    return device;
  }
}