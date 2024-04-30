import 'package:barcode_scanner/classical_components/barcode_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrresult='Scanned Data appear here';
  Future<void> scanqr() async{
    try{
      final qrCode= await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      if(!mounted)return ;
      setState(() {
        this.qrresult=qrCode.toString();
      });
    }on PlatformException{
      qrresult='failed to read qr code';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR CODE SCANNER'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text('$qrresult',style: TextStyle(color: Colors.black),
              ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: scanqr, child: Text('Scan Code'))
          ],
        ),
      ),
    );
  }
}
