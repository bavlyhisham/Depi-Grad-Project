// import 'dart:typed_data';
// import 'package:http/http.dart' as http;
// import 'package:image/image.dart' as img;

// mixin ImageLogic {
//   Future<Uint8List> trimWhitespace(String url) async {
//     final response = await http.get(Uri.parse(url));
//     final original = img.decodeImage(response.bodyBytes)!;

//     int top = 0, bottom = original.height - 1;
//     int left = 0, right = original.width - 1;

//     bool isWhite(img.Pixel p) => p.r > 240 && p.g > 240 && p.b > 240;

//     outerTop:
//     for (int y = 0; y < original.height; y++) {
//       for (int x = 0; x < original.width; x++) {
//         if (!isWhite(original.getPixel(x, y))) {
//           top = y;
//           break outerTop;
//         }
//       }
//     }

//     outerBottom:
//     for (int y = original.height - 1; y >= 0; y--) {
//       for (int x = 0; x < original.width; x++) {
//         if (!isWhite(original.getPixel(x, y))) {
//           bottom = y;
//           break outerBottom;
//         }
//       }
//     }

//     outerLeft:
//     for (int x = 0; x < original.width; x++) {
//       for (int y = 0; y < original.height; y++) {
//         if (!isWhite(original.getPixel(x, y))) {
//           left = x;
//           break outerLeft;
//         }
//       }
//     }

//     outerRight:
//     for (int x = original.width - 1; x >= 0; x--) {
//       for (int y = 0; y < original.height; y++) {
//         if (!isWhite(original.getPixel(x, y))) {
//           right = x;
//           break outerRight;
//         }
//       }
//     }

//     final cropped = img.copyCrop(
//       original,
//       x: left,
//       y: top,
//       width: right - left,
//       height: bottom - top,
//     );

//     return Uint8List.fromList(img.encodePng(cropped));
//   }
// }
