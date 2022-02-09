import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoWidget extends StatefulWidget {
  final String filePath;
  const InfoWidget({Key? key, required this.filePath}) : super(key: key);

  @override
  _InfoWidgetState createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                final channel =
                    const MethodChannel('channel:me.camellabs.share/share');
                channel.invokeMethod('shareFile', 'image.png');
              },
            )
          ],
        ),
        body: Container(
          child: SizedBox(
            height: 500.0,
            child: Center(
                child: widget.filePath == null
                    ? Text('No Image')
                    : Container(
                        child: Image.file(File(widget.filePath),
                            fit: BoxFit.fitWidth))),
          ),
        ));
  }
}
