import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String scann = '';

  Future<void> scanBarCode({loading = true}) async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
      "#ff6666",
      "Cancel",
      true,
      ScanMode.BARCODE,
    )?.listen((barcode) {
      print(barcode);
      setState(() {
        scann = barcode;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: scanBarCode,
          child: const Icon(Icons.camera_alt),
        ),
        body: Center(
          child: Text(scann),
        ),
      ),
    );
  }
}
