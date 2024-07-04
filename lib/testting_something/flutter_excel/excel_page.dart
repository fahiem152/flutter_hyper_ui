// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:hyper_ui/testting_something/flutter_excel/save_file_web.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart';

// class ExcelPage extends StatelessWidget {
//   const ExcelPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Excel Page"),
//         actions: const [],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(20.0),
//           child: Center(
//               child: ElevatedButton(
//             onPressed: generateExcel,
//             child: Text('Generate Excel'),
//           )),
//         ),
//       ),
//     );
//   }

//   Future<void> generateExcel() async {
//     final response = '''
//   {
//     "status": "success",
//     "data": [
//       {
//         "product_id": 18,
//         "product_name": "Kelley Schultz Jr.",
//         "product_price": 50000,
//         "total_quantity": "17",
//         "total_price": "350000"
//       },
//       {
//         "product_id": 20,
//         "product_name": "Prof. Lavonne Medhurst DDS",
//         "product_price": 20000,
//         "total_quantity": "15",
//         "total_price": "140000"
//       },
//       {
//         "product_id": 19,
//         "product_name": "Dr. Brycen Abshire",
//         "product_price": 10000,
//         "total_quantity": "13",
//         "total_price": "70000"
//       },
//       {
//         "product_id": 10,
//         "product_name": "Dr. Jovany Rempel IV",
//         "product_price": 66165,
//         "total_quantity": "1",
//         "total_price": "66165"
//       },
//       {
//         "product_id": 16,
//         "product_name": "Hiram Schmidt II",
//         "product_price": 13875,
//         "total_quantity": "1",
//         "total_price": "13875"
//       },
//       {
//         "product_id": 15,
//         "product_name": "Mellie Kerluke",
//         "product_price": 46663,
//         "total_quantity": "1",
//         "total_price": "46663"
//       },
//       {
//         "product_id": 14,
//         "product_name": "Shania Parisian",
//         "product_price": 75143,
//         "total_quantity": "1",
//         "total_price": "75143"
//       },
//       {
//         "product_id": 13,
//         "product_name": "Prof. Lula D'Amore V",
//         "product_price": 78549,
//         "total_quantity": "1",
//         "total_price": "78549"
//       },
//       {
//         "product_id": 12,
//         "product_name": "Sadye Pouros",
//         "product_price": 32765,
//         "total_quantity": "1",
//         "total_price": "32765"
//       },
//       {
//         "product_id": 11,
//         "product_name": "Sadie Hirthe Jr.",
//         "product_price": 11472,
//         "total_quantity": "1",
//         "total_price": "11472"
//       },
//       {
//         "product_id": 1,
//         "product_name": "Fletcher Stoltenberg",
//         "product_price": 26608,
//         "total_quantity": "1",
//         "total_price": "26608"
//       },
//       {
//         "product_id": 9,
//         "product_name": "Pedro Thiel",
//         "product_price": 17790,
//         "total_quantity": "1",
//         "total_price": "17790"
//       },
//       {
//         "product_id": 8,
//         "product_name": "Mr. Enrico Gulgowski PhD",
//         "product_price": 61248,
//         "total_quantity": "1",
//         "total_price": "61248"
//       },
//       {
//         "product_id": 7,
//         "product_name": "Aron Grady",
//         "product_price": 53917,
//         "total_quantity": "1",
//         "total_price": "53917"
//       },
//       {
//         "product_id": 6,
//         "product_name": "Mr. Selmer Schuster I",
//         "product_price": 58083,
//         "total_quantity": "1",
//         "total_price": "58083"
//       },
//       {
//         "product_id": 5,
//         "product_name": "Prof. Keven Borer",
//         "product_price": 24967,
//         "total_quantity": "1",
//         "total_price": "24967"
//       },
//       {
//         "product_id": 4,
//         "product_name": "Ms. Rosetta Johnston",
//         "product_price": 26333,
//         "total_quantity": "1",
//         "total_price": "26333"
//       },
//       {
//         "product_id": 3,
//         "product_name": "Antwan Feil",
//         "product_price": 50632,
//         "total_quantity": "1",
//         "total_price": "50632"
//       },
//       {
//         "product_id": 2,
//         "product_name": "Oceane Feeney",
//         "product_price": 83262,
//         "total_quantity": "1",
//         "total_price": "83262"
//       }
//     ]
//   }
//   ''';

//     final data = json.decode(response);
//     final products = data['data'] as List<dynamic>;
//     //Create a Excel document.

//     //Creating a workbook.
//     final Workbook workbook = Workbook();
//     //Accessing via index
//     final Worksheet sheet = workbook.worksheets[0];
//     sheet.showGridlines = false;

//     // Enable calculation for worksheet.
//     sheet.enableSheetCalculations();

//     //Set data in the worksheet.
//     sheet.getRangeByName('A1').columnWidth = 4.82;
//     sheet.getRangeByName('B1:C1').columnWidth = 13.82;
//     sheet.getRangeByName('D1').columnWidth = 13.20;
//     sheet.getRangeByName('E1').columnWidth = 7.50;
//     sheet.getRangeByName('F1').columnWidth = 9.73;
//     sheet.getRangeByName('G1').columnWidth = 8.82;
//     sheet.getRangeByName('H1').columnWidth = 4.46;

//     sheet.getRangeByName('A1:H1').cellStyle.backColor = '#333F4F';
//     sheet.getRangeByName('A1:H1').merge();
//     sheet.getRangeByName('B4:D6').merge();

//     sheet.getRangeByName('B3').setText('Invoice');
//     sheet.getRangeByName('B3').cellStyle.fontSize = 32;

//     sheet.getRangeByName('B4').setText('Created Date: 2020-01-01');
//     sheet.getRangeByName('B4').cellStyle.fontSize = 9;

//     sheet.getRangeByName('B8').setText('Summary');
//     sheet.getRangeByName('B8').cellStyle.fontSize = 12;
//     sheet.getRangeByName('B8').cellStyle.bold = true;

//     sheet.getRangeByName('B11').setText('Revenue');
//     sheet.getRangeByName('B11').cellStyle.fontSize = 9;

//     sheet.getRangeByName('B12').setText('Sold Items');
//     sheet.getRangeByName('B12').cellStyle.fontSize = 9;

//     sheet.getRangeByName('B14').setText('Subtotal');
//     sheet.getRangeByName('B14').cellStyle.fontSize = 9;

//     sheet.getRangeByName('B15').setText('Discount');
//     sheet.getRangeByName('B15').cellStyle.fontSize = 9;

//     sheet.getRangeByName('B16').setText('Tax');
//     sheet.getRangeByName('B16').cellStyle.fontSize = 9;

//     sheet.getRangeByName('B17').setText('Service Charge');
//     sheet.getRangeByName('B17').cellStyle.fontSize = 9;

//     sheet.getRangeByName('B19').setText('Total');
//     sheet.getRangeByName('B19').cellStyle.fontSize = 9;

//     final Range range1 = sheet.getRangeByName('F8:G8');
//     final Range range2 = sheet.getRangeByName('F9:G9');
//     final Range range3 = sheet.getRangeByName('F10:G10');
//     final Range range4 = sheet.getRangeByName('F11:G11');
//     final Range range5 = sheet.getRangeByName('F12:G12');
//     final Range range6 = sheet.getRangeByName('F14:G14');
//     final Range range7 = sheet.getRangeByName('F15:G15');
//     final Range range8 = sheet.getRangeByName('F16:G16');
//     final Range range9 = sheet.getRangeByName('F17:G17');
//     final Range range10 = sheet.getRangeByName('F19:G19');

//     range1.merge();
//     range2.merge();
//     range3.merge();
//     range4.merge();
//     range5.merge();
//     range6.merge();
//     range7.merge();
//     range8.merge();
//     range9.merge();
//     range10.merge();

//     // sheet.getRangeByName('F8').setText('INVOICE#');
//     range1.cellStyle.fontSize = 8;
//     range1.cellStyle.bold = true;
//     range1.cellStyle.hAlign = HAlignType.right;

//     // sheet.getRangeByName('F10').setText('Rp. 10.00');
//     // range3.cellStyle.fontSize = 8;
//     // range3.cellStyle.bold = true;
//     // range3.cellStyle.hAlign = HAlignType.right;

//     sheet.getRangeByName('F11').setText('Rp. 10.00');
//     range4.cellStyle.fontSize = 8;
//     range4.cellStyle.bold = true;
//     range4.cellStyle.hAlign = HAlignType.right;

//     sheet.getRangeByName('F12').setText('100');
//     range5.cellStyle.fontSize = 8;
//     range5.cellStyle.bold = true;
//     range5.cellStyle.hAlign = HAlignType.right;

//     sheet.getRangeByName('F14').setText('Rp. 12.00');
//     range6.cellStyle.fontSize = 8;
//     range6.cellStyle.bold = true;
//     range6.cellStyle.hAlign = HAlignType.right;

//     sheet.getRangeByName('F15').setText('Rp. 15.00');
//     range7.cellStyle.fontSize = 8;
//     range7.cellStyle.bold = true;
//     range7.cellStyle.hAlign = HAlignType.right;

//     sheet.getRangeByName('F16').setText('Rp. 18.00');
//     range8.cellStyle.fontSize = 8;
//     range8.cellStyle.bold = true;
//     range8.cellStyle.hAlign = HAlignType.right;

//     sheet.getRangeByName('F17').setText('Rp. 19.00');
//     range9.cellStyle.fontSize = 8;
//     range9.cellStyle.bold = true;
//     range9.cellStyle.hAlign = HAlignType.right;

//     sheet.getRangeByName('F19').setText('Rp. 199.00');
//     range10.cellStyle.fontSize = 8;
//     range10.cellStyle.bold = true;
//     range10.cellStyle.hAlign = HAlignType.right;

//     // final Range range11 = sheet.getRangeByName('B15:G15');
//     // range6.cellStyle.fontSize = 10;
//     // range6.cellStyle.bold = true;

//     // sheet.getRangeByIndex(15, 2).setText('Code');
//     // sheet.getRangeByIndex(16, 2).setText('CA-1098');
//     // sheet.getRangeByIndex(17, 2).setText('LJ-0192');
//     // sheet.getRangeByIndex(18, 2).setText('So-B909-M');
//     // sheet.getRangeByIndex(19, 2).setText('FK-5136');
//     // sheet.getRangeByIndex(20, 2).setText('HL-U509');

//     // sheet.getRangeByIndex(15, 3).setText('Description');
//     // sheet.getRangeByIndex(16, 3).setText('AWC Logo Cap');
//     // sheet.getRangeByIndex(17, 3).setText('Long-Sleeve Logo Jersey, M');
//     // sheet.getRangeByIndex(18, 3).setText('Mountain Bike Socks, M');
//     // sheet.getRangeByIndex(19, 3).setText('ML Fork');
//     // sheet.getRangeByIndex(20, 3).setText('Sports-100 Helmet, Black');

//     // sheet.getRangeByIndex(15, 3, 15, 4).merge();
//     // sheet.getRangeByIndex(16, 3, 16, 4).merge();
//     // sheet.getRangeByIndex(17, 3, 17, 4).merge();
//     // sheet.getRangeByIndex(18, 3, 18, 4).merge();
//     // sheet.getRangeByIndex(19, 3, 19, 4).merge();
//     // sheet.getRangeByIndex(20, 3, 20, 4).merge();

//     // sheet.getRangeByIndex(15, 5).setText('Quantity');
//     // sheet.getRangeByIndex(16, 5).setNumber(2);
//     // sheet.getRangeByIndex(17, 5).setNumber(3);
//     // sheet.getRangeByIndex(18, 5).setNumber(2);
//     // sheet.getRangeByIndex(19, 5).setNumber(6);
//     // sheet.getRangeByIndex(20, 5).setNumber(1);

//     // sheet.getRangeByIndex(15, 6).setText('Price');
//     // sheet.getRangeByIndex(16, 6).setNumber(8.99);
//     // sheet.getRangeByIndex(17, 6).setNumber(49.99);
//     // sheet.getRangeByIndex(18, 6).setNumber(9.50);
//     // sheet.getRangeByIndex(19, 6).setNumber(175.49);
//     // sheet.getRangeByIndex(20, 6).setNumber(34.99);

//     // sheet.getRangeByIndex(15, 7).setText('Total');
//     // sheet.getRangeByIndex(16, 7).setFormula('=E16*F16+(E16*F16)');
//     // sheet.getRangeByIndex(17, 7).setFormula('=E17*F17+(E17*F17)');
//     // sheet.getRangeByIndex(18, 7).setFormula('=E18*F18+(E18*F18)');
//     // sheet.getRangeByIndex(19, 7).setFormula('=E19*F19+(E19*F19)');
//     // sheet.getRangeByIndex(20, 7).setFormula('=E20*F20+(E20*F20)');
//     // sheet.getRangeByIndex(15, 6, 20, 7).numberFormat = r'$#,##0.00';

//     // sheet.getRangeByName('E15:G15').cellStyle.hAlign = HAlignType.right;
//     // sheet.getRangeByName('B15:G15').cellStyle.fontSize = 10;
//     // sheet.getRangeByName('B15:G15').cellStyle.bold = true;
//     // sheet.getRangeByName('B16:G20').cellStyle.fontSize = 9;

//     // sheet.getRangeByName('E22:G22').merge();
//     // sheet.getRangeByName('E22:G22').cellStyle.hAlign = HAlignType.right;
//     // sheet.getRangeByName('E23:G24').merge();

//     // final Range range12 = sheet.getRangeByName('E22');
//     // final Range range13 = sheet.getRangeByName('E23');
//     // range7.setText('TOTAL');
//     // range7.cellStyle.fontSize = 8;
//     // range8.setFormula('=SUM(G16:G20)');
//     // range8.numberFormat = r'$#,##0.00';
//     // range8.cellStyle.fontSize = 24;
//     // range8.cellStyle.hAlign = HAlignType.right;
//     // range8.cellStyle.bold = true;

//     sheet.getRangeByName('B22').setText('No');
//     sheet.getRangeByName('C22').setText('Product ID');
//     sheet.getRangeByName('D22').setText('Product Name');
//     sheet.getRangeByName('E22').setText('Price');
//     sheet.getRangeByName('F22').setText('Quantity');
//     sheet.getRangeByName('G22').setText('Total Price');
//     final Range headerRange = sheet.getRangeByName('B22:G22');
//     headerRange.cellStyle.backColor = '#3949AB'; // Background color
//     headerRange.cellStyle.fontColor = '#FFFFFF'; // Font color
//     headerRange.cellStyle.bold = true; // Bold text
//     headerRange.cellStyle.hAlign = HAlignType.center; // Center align text
//     headerRange.cellStyle.borders.all.lineStyle = LineStyle.thin;

//     for (int i = 0; i < products.length; i++) {
//       final product = products[i];
//       final int row = 23 + i;
//       sheet.getRangeByIndex(row, 2).setNumber(i + 1);
//       sheet.getRangeByIndex(row, 3).setText(product['product_id'].toString());
//       sheet.getRangeByIndex(row, 4).setText(product['product_name']);
//       sheet.getRangeByIndex(row, 5).setText('Rp. ${product['product_price']}');
//       sheet.getRangeByIndex(row, 6).setText(product['total_quantity']);
//       sheet.getRangeByIndex(row, 7).setText('Rp. ${product['total_price']}');

//       // Set borders for columns A to F (1 to 6)

//       for (int col = 2; col <= 7; col++) {
//         final Range cellRange = sheet.getRangeByIndex(row, col);
//         cellRange.cellStyle.borders.all.lineStyle = LineStyle.thin;
//         cellRange.cellStyle.borders.all.color = '#000000';
//         cellRange.cellStyle.hAlign = HAlignType.center;
//         cellRange.cellStyle.vAlign = VAlignType.center;
//         cellRange.cellStyle.fontSize = 8;
//       }
//     }

//     sheet.getRangeByIndex(45, 1).text =
//         'Jalan Melati No. 1, Bandung, Jawa Barat';
//     sheet.getRangeByIndex(45, 1).cellStyle.fontSize = 8;

//     final Range range12 = sheet.getRangeByName('A45:H46');
//     range12.cellStyle.backColor = '#f5f5f5';
//     range12.merge();
//     range12.cellStyle.hAlign = HAlignType.center;
//     range12.cellStyle.vAlign = VAlignType.center;

//     //Save and launch the excel.
//     final List<int> bytes = workbook.saveAsStream();
//     //Dispose the document.
//     workbook.dispose();

//     //Save and launch the file.
//     await saveAndLaunchFile(bytes, 'Invoice.xlsx');
//   }
// }
