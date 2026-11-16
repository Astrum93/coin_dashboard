import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:coin_dashboard/common/constants/api_constants.dart';
import 'package:coin_dashboard/features/data/models/coin_links_model.dart';
import 'package:coin_dashboard/features/data/models/news_article_model.dart';

/// CoinGecko 검색 결과 한 건.
typedef CoinSearchHit = ({String id, String symbol, String name});

/// 코인 부가 정보(공식 링크·뉴스) 원격 데이터 소스.
abstract class CoinInfoRemoteDataSource {
  /// 시가총액 순.
  Future<List<CoinSearchHit>> searchCoins(String query);

  Future<CoinLinksModel> fetchLinks(String coinGeckoId);

  /// [feedUrl] RSS 주소. 최신 기사 몇 건만 온다.
  Future<List<NewsArticleModel>> fetchFeed(String feedUrl);
}

/// CoinGecko · rss2json 구현. 실패 시 예외를 던진다.
class CoinInfoRemoteDataSourceImpl implements CoinInfoRemoteDataSource {
  final http.Client client;

  CoinInfoRemoteDataSourceImpl(this.client);

  @override
  Future<List<CoinSearchHit>> searchCoins(String query) async {
    final json = await _getMap(ApiConstants.coinGeckoSearch(query));
    return [
      for (final c
          in (json['coins'] as List<dynamic>? ?? const [])
              .cast<Map<String, dynamic>>())
        (
          id: c['id'] as String,
          symbol: c['symbol'] as String,
          name: c['name'] as String,
        ),
    ];
  }

  @override
  Future<CoinLinksModel> fetchLinks(String coinGeckoId) async {
    return CoinLinksModel.fromJson(
      await _getMap(ApiConstants.coinGeckoCoin(coinGeckoId)),
    );
  }

  @override
  Future<List<NewsArticleModel>> fetchFeed(String feedUrl) async {
    final json = await _getMap(ApiConstants.rssToJson(feedUrl));
    if (json['status'] != 'ok') {
      throw Exception('피드 변환 실패: ${json['message']}');
    }
    return (json['items'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>()
        .map(NewsArticleModel.fromJson)
        .toList();
  }

  Future<Map<String, dynamic>> _getMap(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('서버 응답 오류: ${response.statusCode}');
    }
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
  }
}
