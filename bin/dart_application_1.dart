import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() {
  String token = 'ad3c69dcfbmshe8c909b89016d9cp1b67adjsnd7a7a4a39bb3';

  print('\x1B[36mВам доступно 3 команди translate/detect/end\x1B[0m');

  while (true) {
    print('\x1B[33mВведіть команду: \x1B[0m');
    String comand = stdin.readLineSync() ?? 'end';
    if (comand == 'translate') {
        print('\x1B[33mВведіть слово для прекладу: \x1B[0m');
        String input = stdin.readLineSync() ?? 'Hello, world!';
        postTranslete(token, input);
    } else if (comand == 'detect') {
        print('\x1B[33mВведіть слово для визначення мови: \x1B[0m');
        String input = stdin.readLineSync() ?? 'Hello, world!';
      postDetect(token, input);
    } else if (comand == 'end') {
        break;
    }
  }
}


void postTranslete(String token, translateWords) async {
  String url = 'https://google-translate1.p.rapidapi.com/language/translate/v2';
  var payload = {
    'q': translateWords,
    'target': 'uk',
    'source': 'en',
  };
  var headers = {
    'content-type': 'application/json',
    'Accept': 'application/json',
    'X-RapidAPI-Key': token,
    'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com',
  };

  var response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(payload),
  );

  print(response.body);
}


void postDetect(String token, detectWords) async {
  String url = "https://google-translate1.p.rapidapi.com/language/translate/v2/detect";

  var headers = {
	"content-type": "application/json",
	"Accept-Encoding": "application/json",
	"X-RapidAPI-Key": token,
	"X-RapidAPI-Host": "google-translate1.p.rapidapi.com"
  };

  var payload = { "q": detectWords };

  var response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(payload),
  );

  print(response.body);
}
