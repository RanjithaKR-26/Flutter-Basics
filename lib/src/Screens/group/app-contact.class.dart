import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class AppContact {
  final Color color;
  final Contact info;
  bool select = false;
  bool isGroup;

  AppContact({
    Key? key,
    required this.color,
    required this.info,
    required this.isGroup,
    this.select = false,
 
  });
}
