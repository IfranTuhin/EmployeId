import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWidget;

class CreatePdf {
  Future<html.Blob> downloadReport() async {
    List<pdfWidget.Widget> widgetList = [];
    final pdf = pdfWidget.Document(pageMode: PdfPageMode.fullscreen);
    pdf.addPage(
      pdfWidget.MultiPage(
        pageFormat: PdfPageFormat.a4.copyWith(),
        header: (pdfWidget.Context context) {
          return pdfWidget.Container();
        },
        footer: (pdfWidget.Context context) {
          return pdfWidget.Container();
        },
        build: (pdfWidget.Context context) {
          return widgetList;
        },
      ),
    );
    final bytes = await pdf.save();
    html.Blob pdfBlob = html.Blob([bytes], 'application/pdf');
    return pdfBlob;
  }

  List<pdfWidget.Widget> getData(){
    return [

    ];
  }

}
