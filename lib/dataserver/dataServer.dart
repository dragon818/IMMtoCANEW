import 'dart:convert';
import 'dart:io';

class DataServer {
  var url = 'http://www.dragonwarrior.space/immgrate-to-canada.txt';
  var httpClient = new HttpClient();

  Future<Map<String, dynamic>> getJsonData() async {
    Map<String, dynamic> result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        Map<String, dynamic> data = jsonDecode(json);
        result = data;
      } else {
        result = 'Error  _getSeverData :\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed _getSeverData exception' + exception.toString();
    }
    return result;
  }
}
