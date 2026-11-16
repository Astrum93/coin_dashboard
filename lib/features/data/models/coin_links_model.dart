import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:coin_dashboard/features/domain/entities/coin_links.dart';

part 'coin_links_model.freezed.dart';

/// CoinGecko /coins/{id} 의 links DTO.
@freezed
abstract class CoinLinksModel with _$CoinLinksModel {
  const CoinLinksModel._();

  const factory CoinLinksModel({
    String? homepage,
    String? twitterScreenName,
    String? telegramChannel,
    String? subredditUrl,
    String? github,
    String? whitepaper,
  }) = _CoinLinksModel;

  /// coins/{id} 응답 전체를 받아 links 만 읽는다. 빈 문자열은 없음으로 본다.
  factory CoinLinksModel.fromJson(Map<String, dynamic> json) {
    final links = json['links'] as Map<String, dynamic>? ?? const {};
    String? first(Object? list) => (list as List<dynamic>? ?? const [])
        .whereType<String>()
        .where((s) => s.isNotEmpty)
        .firstOrNull;
    String? text(Object? value) =>
        value is String && value.isNotEmpty ? value : null;
    final repos = links['repos_url'] as Map<String, dynamic>? ?? const {};

    return CoinLinksModel(
      homepage: first(links['homepage']),
      twitterScreenName: text(links['twitter_screen_name']),
      telegramChannel: text(links['telegram_channel_identifier']),
      subredditUrl: text(links['subreddit_url']),
      github: first(repos['github']),
      whitepaper: text(links['whitepaper']),
    );
  }

  /// DTO → 엔티티. 값이 있는 링크만 고정 순서로.
  List<CoinLink> toEntity() => [
    if (homepage != null) CoinLink(type: CoinLinkType.homepage, url: homepage!),
    if (twitterScreenName != null)
      CoinLink(type: CoinLinkType.x, url: 'https://x.com/$twitterScreenName'),
    if (telegramChannel != null)
      CoinLink(
        type: CoinLinkType.telegram,
        url: 'https://t.me/$telegramChannel',
      ),
    if (subredditUrl != null)
      CoinLink(type: CoinLinkType.reddit, url: subredditUrl!),
    if (github != null) CoinLink(type: CoinLinkType.github, url: github!),
    if (whitepaper != null)
      CoinLink(type: CoinLinkType.whitepaper, url: whitepaper!),
  ];
}
