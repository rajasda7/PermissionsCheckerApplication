import 'package:flutter/material.dart';
import 'package:permission_check_ui/screens/permissions_screen.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'PermissionsUI',
    home: PermissionsScreen(),
  ));
}