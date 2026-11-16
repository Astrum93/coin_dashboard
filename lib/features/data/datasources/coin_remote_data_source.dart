import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:coin_dashboard/common/constants/api_constants.dart';
import 'package:coin_dashboard/features/data/models/candle_model.dart';
import 'package:coin_dashboard/features/data/models/coin_detail_model.dart';
import 'package:coin_dashboard/features/data/models/market_ticker_model.dart';
import 'package:coin_dashboard/features/data/models/orderbook_model.dart';
import 'package:coin_dashboard/features/data/models/trade_model.dart';
import 'package:coin_dashboard/features/domain/entities/candle.dart';

/// 마켓 한글명·영문명. 예: (korean: '비트코인', english: 'Bitcoin')
typedef MarketName = ({String korean, String english});

/// 원격 API 데이터 소스.
abstract class CoinRemoteDataSource {
  /// 마켓 코드 → 이름. 예: {'KRW-BTC': (korean: '비트코인', english: 'Bitcoin')}
  Future<Map<String, MarketName>> fetchMarketNames();

  Future<List<MarketTickerModel>> fetchKrwTickers();

  /// [market] 예: 'KRW-BTC'
  Future<CoinDetailModel> fetchTicker(String market);

  Future<OrderbookModel> fetchOrderbook(String market, int levels);

  /// 최신 체결이 앞에 온다.
  Future<List<TradeModel>> fetchTrades(String market, int count);

  /// 응답 그대로 최신 캔들이 앞에 온다. count 는 최대 200, [to] 이전 캔들만.
  Future<List<CandleModel>> fetchCandles({
    required String market,
    required CandleUnit unit,
    required int count,
    String? to,
  });
}

/// 업비트 구현. 실패 시 예외를 던진다 (Result 변환은 리포지토리 몫).
class CoinRemoteDataSourceImpl implements CoinRemoteDataSource {
  final http.Client client;

  CoinRemoteDataSourceImpl(this.client);

  @override
  Future<Map<String, MarketName>> fetchMarketNames() async {
    final list = await _getList(ApiConstants.marketAll);
    return {
      for (final item in list.cast<Map<String, dynamic>>())
        item['market'] as String: (
          korean: item['korean_name'] as String,
          english: item['english_name'] as String,
        ),
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
  Future<OrderbookModel> fetchOrderbook(String market, int levels) async {
    final list = await _getList(ApiConstants.orderbook(market, levels));
    if (list.isEmpty) throw Exception('호가 없음: $market');
    return OrderbookModel.fromJson(list.first as Map<String, dynamic>);
  }

  @override
  Future<List<TradeModel>> fetchTrades(String market, int count) async {
    final list = await _getList(ApiConstants.trades(market, count));
    return list.cast<Map<String, dynamic>>().map(TradeModel.fromJson).toList();
  }

  @override
  Future<List<CandleModel>> fetchCandles({
    required String market,
    required CandleUnit unit,
    required int count,
    String? to,
  }) async {
    final path = switch (unit) {
      CandleUnit.minutes15 => 'minutes/15',
      CandleUnit.minutes30 => 'minutes/30',
      CandleUnit.minutes60 => 'minutes/60',
      CandleUnit.minutes240 => 'minutes/240',
      CandleUnit.days => 'days',
      CandleUnit.weeks => 'weeks',
    };
    final list = await _getList(
      ApiConstants.candles(path, market, count, to: to),
    );
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
