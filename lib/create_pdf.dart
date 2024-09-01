import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<File> generatePdf(String name) async {
  final pdf = Document();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  pdf.addPage(
    Page(
      build: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Hello $name!',
                  style: TextStyle(
                      font: font, fontSize: 100, fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    ),
  );

  final root = getExternalStorageDirectory();
  final file = File('${(await root)!.path}/example.pdf');
  await file.writeAsBytes(await pdf.save());

  return file;
}

Future<void> openPdf(File file) async {
  final filePath = file.path;
  await OpenFile.open(filePath);
}
