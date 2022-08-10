import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Utils {
  static Future<File> fileFromImageUrl(String url,
      {String format = 'jpeg'}) async {
    final response = await http.get(Uri.parse(url));

    final tempDir = await getTemporaryDirectory();
    final clearUrl = url.replaceAll('/', '');
    final file = File(join(tempDir.path,
        '$clearUrl${DateTime.now().millisecondsSinceEpoch}.$format'));

    file.writeAsBytesSync(response.bodyBytes);

    return file;
  }
}
