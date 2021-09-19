import 'dart:convert';
import 'dart:io';

class DataServer {
  var url = 'http://www.dragonwarrior.space/immgrate-to-canada.txt';
  var httpClient = new HttpClient();

  Future<Map<String, dynamic>> getJsonData() async {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      var json = await response.transform(utf8.decoder).join();
      Map<String, dynamic> data = jsonDecode(json);
      return data;
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
