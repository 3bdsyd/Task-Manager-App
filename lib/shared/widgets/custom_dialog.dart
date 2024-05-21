import 'package:flutter/material.dart';

Future customShowDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Align(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
