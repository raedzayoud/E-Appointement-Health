import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:health/core/class/statusrequest.dart';
import 'package:health/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

// Basic Authentication Header
final String _basicAuth = 'Basic ${base64Encode(utf8.encode('raed:raed12'))}';
final Map<String, String> _headers = {'authorization': _basicAuth};

class Crud {
  // Post Data Method
  Future<Either<StatusRequest, Map>> postData(
      String linkapi, Map<String, String> data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(linkapi),
          headers: _headers,
          body: data,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          print("Server Failure: ${response.statusCode}");
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        print("No Internet Connection");
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print("Exception: $e");
      return const Left(StatusRequest.serverexception);
    }
  }

  // Add Request With Image Method
  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      String url, Map<String, String> data, File? image,
      [String namerequest = "files"]) async {
    try {
      if (!await checkInternet()) {
        print("No Internet Connection");
        return const Left(StatusRequest.offlinefailure);
      }

      var uri = Uri.parse(url);
      var request = http.MultipartRequest("POST", uri)
        ..headers.addAll(_headers);

      // Attach image if provided
      if (image != null) {
        var length = await image.length();
        var stream = http.ByteStream(image.openRead().cast());
        var multipartFile = http.MultipartFile(
          namerequest,
          stream,
          length,
          filename: basename(image.path),
        );
        request.files.add(multipartFile);
      }

      // Attach other data fields
      request.fields.addAll(data);

      // Send Request
      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        print(responseBody);
        return Right(responseBody);
      } else {
        print("Server Failure: ${response.statusCode}");
        return const Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      print("Exception: $e");
      return const Left(StatusRequest.serverexception);
    }
  }
}
