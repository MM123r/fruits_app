  import 'package:flutter/material.dart';

void buildErrorsBar(BuildContext context,  String message) {
     ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }