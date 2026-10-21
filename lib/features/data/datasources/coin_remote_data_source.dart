import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:coin_dashboard/common/constants/api_constants.dart';
import 'package:coin_dashboard/features/data/models/coin_model.dart';

/// 원격 API 데이터 소스.
abstract class CoinRemoteDataSource {
  Future<CoinModel> fetchPrice({required String id, required String symbol});
}

/// 업비트 구현. 실패 시 예외를 던진다 (Result 변환은 리포지토리 몫).
class CoinRemoteDataSourceImpl implements CoinRemoteDataSource {
  final http.Client client;

  CoinRemoteDataSourceImpl(this.client);

  /// [id] 는 업비트 마켓 코드. 예: 'KRW-BTC'
  @override
  Future<CoinModel> fetchPrice({
    required String id,
    required String symbol,
  }) async {
    final url = Uri.parse(ApiConstants.ticker(id));
    final response = await client.get(url);

    if (response.statusCode != 200) {
      throw Exception('서버 응답 오류: ${response.statusCode}');
    }

    // 응답은 배열. 마켓 하나만 요청했으므로 첫 요소를 쓴다.
    final list = jsonDecode(response.body) as List<dynamic>;
    if (list.isEmpty) {
      throw Exception('시세 없음: $id');
    }
    return CoinModel.fromTicker(
      symbol: symbol,
      json: list.first as Map<String, dynamic>,
    );
  }
}
