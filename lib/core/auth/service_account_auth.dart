import 'package:cms_sheets/generated/assets.dart';
import 'package:flutter/services.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';

const _scopes = [SheetsApi.spreadsheetsScope];

Future<SheetsApi> getServiceAccountSheetsApi() async {
  final jsonString = await rootBundle.loadString(
    Assets.flutterCmsSheet31030e053f3c,
  );

  final credentials = ServiceAccountCredentials.fromJson(jsonString);
  final authClient = await clientViaServiceAccount(credentials, _scopes);

  return SheetsApi(authClient);
}
