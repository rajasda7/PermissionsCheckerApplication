import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _PermissionsScreen();
  }
}

class _PermissionsScreen extends State<PermissionsScreen>{

  var allPermissions = ['File System','Camera','Location','Bluetooth','SMS', 'Voice Input','Notifications'];
  var permissionsGranted = [];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Test App'),centerTitle: true,),
      body: Column(
        children: [
          Container(padding: EdgeInsets.all(8.0),
            child: Text(
              'Permissions Allowed :',
              style: TextStyle(fontSize: 20.0, decoration: TextDecoration.underline),
            ),),
          ListView.builder(
            shrinkWrap: true,
            itemCount: allPermissions.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: permissionsGranted.contains(allPermissions[index]) ? Image.asset('images/correctIcon.png',width:50,height: 50,) : Image.asset('images/wrongIcon.png',width: 25,height: 25,),
                title: Text(allPermissions[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getPermission().whenComplete((){
      getPermissionStatus().whenComplete((){setState(() {

      });});
    });
  }

 Future<void> getPermission() async{
    Map<Permission, PermissionStatus> status = await [
      Permission.storage,
      Permission.camera,
      Permission.location,
      Permission.bluetooth,
      Permission.sms,
      Permission.microphone,
      Permission.notification,
    ].request();

 }
  Future<void> getPermissionStatus() async{
   if(await Permission.storage.isGranted){ permissionsGranted.add(allPermissions[0]);}
   if(await Permission.camera.isGranted){ permissionsGranted.add(allPermissions[1]);}
   if(await Permission.location.isGranted){ permissionsGranted.add(allPermissions[2]);}
   if(await Permission.bluetooth.isGranted){ permissionsGranted.add(allPermissions[3]);}
   if(await Permission.sms.isGranted){permissionsGranted.add(allPermissions[4]);}
   if(await Permission.microphone.isGranted){ permissionsGranted.add(allPermissions[5]);}
   if(await Permission.notification.isGranted){ permissionsGranted.add(allPermissions[6]);}
  }
}