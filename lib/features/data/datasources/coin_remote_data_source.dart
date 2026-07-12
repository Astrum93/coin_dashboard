import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:coin_dashboard/common/constants/api_constants.dart';
import 'package:coin_dashboard/features/data/models/coin_model.dart';

/// 원격(API) 데이터 소스 인터페이스.
/// "네트워크에서 시세를 가져온다"는 저수준 역할만 담당한다.
abstract class CoinRemoteDataSource {
  Future<CoinModel> fetchPrice({required String id, required String symbol});
}

/// 실제 구현 — http 로 CoinGecko 를 호출한다.
/// 실패 시 예외를 던진다(성공/실패로 감싸는 건 상위 리포지토리의 몫).
class CoinRemoteDataSourceImpl implements CoinRemoteDataSource {
  final http.Client client;

  CoinRemoteDataSourceImpl(this.client);

  @override
  Future<CoinModel> fetchPrice({
    required String id,
    required String symbol,
  }) async {
    final url = Uri.parse(ApiConstants.simplePrice(id, 'krw'));
    final response = await client.get(url);

    if (response.statusCode != 200) {
      throw Exception('서버 응답 오류: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return CoinModel.fromSimplePrice(id: id, symbol: symbol, json: json);
  }
}
