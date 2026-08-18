import 'package:cms_sheets/core/auth/service_account_auth.dart';
import 'package:cms_sheets/features/catalog/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googleapis/sheets/v4.dart';

const _spreadsheetId = "MY_SPREADSHEET_ID";
const _range = 'Sheet1!A2:E';

class SheetsRepository {
  SheetsApi? _api;

  Future<SheetsApi> get _sheetsApi async {
    _api ??= await getServiceAccountSheetsApi();
    return _api!;
  }

  Future<List<Product>> fetchProducts() async {
    final api = await _sheetsApi;
    final response = await api.spreadsheets.values.get(_spreadsheetId, _range);

    final rows = response.values;

    if (rows == null || rows.isEmpty) return [];

    return rows
        .where((row) => row.length >= 5)
        .map((row) => Product.fromSheetRow(row))
        .toList();
  }
}

final sheetsRepositoryProvider = Provider<SheetsRepository>(
  (ref) => SheetsRepository(),
);
