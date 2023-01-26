import 'package:flutter/material.dart';
import 'package:test_flutter/controller/home_controller.dart';
import 'package:test_flutter/model/device.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = HomeController();
  Future<List<Devices>>? device;

  @override
  void initState() {
    device = controller.getDevicesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Device"),
        ),
        body: FutureBuilder(
            future: device,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = snapshot.data[index];
                      debugPrint("$index");
                      return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        title: Text(data.name ?? "null"),
                        subtitle: Text(data.category ?? "null"),
                        leading: Icon(Icons.location_on),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    );
                    }
                  ));
            }));
  }
}
