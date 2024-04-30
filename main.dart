import 'package:flutter/material.dart';
import 'package:qr_code/generate_qr_code.dart';
import 'package:qr_code/scan_qr_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'QR CODE SCANNER',
      debugShowCheckedModeBanner: false,
      home: MyHomepage(),
    );
  }
}
class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR CODE SCANNER"),backgroundColor: Colors.green,),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ScanQRCode()));
              });
            }, child: const Text('Scan QR code')),
            const SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const GenerateQRCode()));
              });
            }, child: const Text('Generate QR code')),

          ],
        )
      ),
    );
  }
}
