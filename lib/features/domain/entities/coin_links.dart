import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_links.freezed.dart';

/// 공식 채널 종류.
enum CoinLinkType {
  homepage('홈페이지'),
  x('X'),
  telegram('텔레그램'),
  reddit('레딧'),
  github('GitHub'),
  whitepaper('백서');

  const CoinLinkType(this.label);
  final String label;
}

/// 코인 공식 링크 한 개.
@freezed
abstract class CoinLink with _$CoinLink {
  const factory CoinLink({required CoinLinkType type, required String url}) =
      _CoinLink;
}
