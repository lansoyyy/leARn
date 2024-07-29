import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ARView extends StatefulWidget {
  String file;
  String name;
  ARView({super.key, required this.file, required this.name});

  @override
  State<ARView> createState() => _ARViewState();
}

class _ARViewState extends State<ARView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: ModelViewer(
          backgroundColor: const Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
          src: widget.file,
          alt: 'A 3D model of an astronaut',
          ar: true,
          autoRotate: true,
          iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
          disableZoom: true,
        ),
      ),
    );
  }
}
