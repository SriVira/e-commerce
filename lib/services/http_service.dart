import 'package:http/http.dart';

Future<Response> postRequest(String url, Object body, {String? token}) async {
  final headers = <String, String>{};
  headers['Content-Type'] = 'application/x-www-form-urlencoded';
  if (token != null && token.isNotEmpty) {
    headers['Authorization'] = 'Bearer $token';
  }

  return await post(Uri.parse(url), body: body, headers: headers);
}

Future<Response> getRequest(String url, {String? token}) async {
  final headers = <String, String>{};
  headers['Content-Type'] = 'application/x-www-form-urlencoded';
  if (token != null && token.isNotEmpty) {
    headers['Authorization'] = 'Bearer $token';
  }

  return await get(Uri.parse(url), headers: headers);
}
