import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:coin_dashboard/common/constants/api_constants.dart';
import 'package:coin_dashboard/features/data/models/candle_model.dart';
import 'package:coin_dashboard/features/data/models/coin_detail_model.dart';
import 'package:coin_dashboard/features/data/models/market_ticker_model.dart';
import 'package:coin_dashboard/features/domain/entities/candle.dart';

/// 원격 API 데이터 소스.
abstract class CoinRemoteDataSource {
  /// 마켓 코드 → 한글명. 예: {'KRW-BTC': '비트코인'}
  Future<Map<String, String>> fetchMarketNames();

  Future<List<MarketTickerModel>> fetchKrwTickers();

  /// [market] 예: 'KRW-BTC'
  Future<CoinDetailModel> fetchTicker(String market);

  /// 응답 그대로 최신 캔들이 앞에 온다.
  Future<List<CandleModel>> fetchCandles({
    required String market,
    required CandleUnit unit,
    required int count,
  });
}

/// 업비트 구현. 실패 시 예외를 던진다 (Result 변환은 리포지토리 몫).
class CoinRemoteDataSourceImpl implements CoinRemoteDataSource {
  final http.Client client;

  CoinRemoteDataSourceImpl(this.client);

  @override
  Future<Map<String, String>> fetchMarketNames() async {
    final list = await _getList(ApiConstants.marketAll);
    return {
      for (final item in list.cast<Map<String, dynamic>>())
        item['market'] as String: item['korean_name'] as String,
    };
  }

  @override
  Future<List<MarketTickerModel>> fetchKrwTickers() async {
    final list = await _getList(ApiConstants.krwTickers);
    return list
        .cast<Map<String, dynamic>>()
        .map(MarketTickerModel.fromJson)
        .toList();
  }

  @override
  Future<CoinDetailModel> fetchTicker(String market) async {
    final list = await _getList(ApiConstants.ticker(market));
    if (list.isEmpty) throw Exception('시세 없음: $market');
    return CoinDetailModel.fromJson(list.first as Map<String, dynamic>);
  }

  @override
  Future<List<CandleModel>> fetchCandles({
    required String market,
    required CandleUnit unit,
    required int count,
  }) async {
    final path = switch (unit) {
      CandleUnit.minutes30 => 'minutes/30',
      CandleUnit.minutes240 => 'minutes/240',
      CandleUnit.days => 'days',
      CandleUnit.weeks => 'weeks',
    };
    final list = await _getList(ApiConstants.candles(path, market, count));
    return list.cast<Map<String, dynamic>>().map(CandleModel.fromJson).toList();
  }

  Future<List<dynamic>> _getList(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('서버 응답 오류: ${response.statusCode}');
    }
    return jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
  }
}
