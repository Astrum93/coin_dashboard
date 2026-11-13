import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'package:coin_dashboard/app/theme/app_colors.dart';
import 'package:coin_dashboard/app/theme/app_text_styles.dart';
import 'package:coin_dashboard/common/utils/formatter.dart';
import 'package:coin_dashboard/features/domain/entities/candle.dart';
import 'package:coin_dashboard/features/presentation/coin_detail/controller/coin_detail_controller.dart';

/// 가격(캔들/라인)·거래량·축 라벨·현재가 표시를 한 번에 그린다.
class CandleChartPainter extends CustomPainter {
  CandleChartPainter({
    required this.candles,
    required this.mode,
    required this.timePattern,
    this.currentPrice,
    this.changeRate = 0,
  });

  final List<Candle> candles;
  final ChartMode mode;

  /// x 축 시각 형식. 예: 'HH:mm'
  final String timePattern;

  /// 3초마다 갱신되는 현재가. 가로 점선과 축 태그로 표시한다.
  final double? currentPrice;

  /// 전일 대비 등락률. 현재가 점선·태그 색을 헤더와 맞춘다.
  final double changeRate;

  static const double volumeHeight = 56;
  static const double _axisWidth = 92;
  static const double _gap = 14;
  static const double _labelHeight = 22;

  static final TextStyle _axisStyle = AppTextStyles.NUMBER_SMALL.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.TEXT_MUTED,
  );

  @override
  void paint(Canvas canvas, Size size) {
    if (candles.isEmpty) return;

    final plotWidth = size.width - _axisWidth;
    final priceHeight = size.height - _gap - volumeHeight - _labelHeight;
    final slot = plotWidth / candles.length;

    final (low, high) = _range();
    double y(double v) => (high - v) / (high - low) * priceHeight;
    double x(int i) => slot * (i + 0.5);

    _paintGrid(canvas, plotWidth, y, low, high);

    if (mode == ChartMode.candle) {
      _paintCandles(canvas, slot, x, y);
    } else {
      _paintLine(canvas, plotWidth, priceHeight, x, y);
    }

    final price = currentPrice;
    if (price != null) _paintCurrentPrice(canvas, plotWidth, y(price), price);

    _paintVolume(canvas, slot, x, priceHeight + _gap);
    _paintTimeLabels(canvas, plotWidth, size.height - _labelHeight + 6, x);
  }

  /// 표시할 가격 범위. 위아래로 6% 여유를 둔다.
  (double, double) _range() {
    final lows = mode == ChartMode.candle
        ? candles.map((c) => c.low)
        : candles.map((c) => c.close);
    final highs = mode == ChartMode.candle
        ? candles.map((c) => c.high)
        : candles.map((c) => c.close);
    var low = lows.reduce(math.min);
    var high = highs.reduce(math.max);
    final price = currentPrice;
    if (price != null) {
      low = math.min(low, price);
      high = math.max(high, price);
    }
    final pad = high == low ? high * 0.01 : (high - low) * 0.06;
    return (low - pad, high + pad);
  }

  /// 1·2·5 단위로 떨어지는 가격마다 가로선과 라벨을 그린다.
  void _paintGrid(
    Canvas canvas,
    double width,
    double Function(double) y,
    double low,
    double high,
  ) {
    final paint = Paint()
      ..color = AppColors.DIVIDER
      ..strokeWidth = 1;
    final step = _niceStep((high - low) / 5);
    for (var value = (low / step).ceil() * step; value <= high; value += step) {
      final dy = y(value);
      canvas.drawLine(Offset(0, dy), Offset(width, dy), paint);
      _text(canvas, formatPrice(value), Offset(width + 10, dy), alignY: 0.5);
    }
  }

  /// raw 에 가장 가까운 1·2·5 × 10^n.
  static double _niceStep(double raw) {
    final magnitude = math.pow(10, (math.log(raw) / math.ln10).floor());
    final fraction = raw / magnitude;
    final nice = fraction < 1.5
        ? 1
        : fraction < 3
        ? 2
        : fraction < 7
        ? 5
        : 10;
    return nice * magnitude.toDouble();
  }

  void _paintCandles(
    Canvas canvas,
    double slot,
    double Function(int) x,
    double Function(double) y,
  ) {
    final bodyWidth = math.max(1.0, slot * 0.62);
    for (var i = 0; i < candles.length; i++) {
      final c = candles[i];
      final color = c.close >= c.open ? AppColors.RISE : AppColors.FALL;
      final paint = Paint()..color = color;
      final cx = x(i);
      canvas.drawLine(
        Offset(cx, y(c.high)),
        Offset(cx, y(c.low)),
        paint..strokeWidth = 1,
      );
      final top = y(math.max(c.open, c.close));
      final bottom = y(math.min(c.open, c.close));
      canvas.drawRect(
        Rect.fromLTRB(
          cx - bodyWidth / 2,
          top,
          cx + bodyWidth / 2,
          math.max(bottom, top + 1),
        ),
        paint,
      );
    }
  }

  void _paintLine(
    Canvas canvas,
    double width,
    double height,
    double Function(int) x,
    double Function(double) y,
  ) {
    final line = Path();
    for (var i = 0; i < candles.length; i++) {
      final point = Offset(x(i), y(candles[i].close));
      i == 0
          ? line.moveTo(point.dx, point.dy)
          : line.lineTo(point.dx, point.dy);
    }
    final area = Path.from(line)
      ..lineTo(x(candles.length - 1), height)
      ..lineTo(x(0), height)
      ..close();
    canvas.drawPath(
      area,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.ACCENT.withValues(alpha: 0.22),
            AppColors.ACCENT.withValues(alpha: 0),
          ],
        ).createShader(Rect.fromLTWH(0, 0, width, height)),
    );
    canvas.drawPath(
      line,
      Paint()
        ..color = AppColors.ACCENT
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeJoin = StrokeJoin.round,
    );
  }

  void _paintCurrentPrice(
    Canvas canvas,
    double width,
    double dy,
    double price,
  ) {
    final color = AppColors.change(changeRate);
    final paint = Paint()
      ..color = color.withValues(alpha: 0.7)
      ..strokeWidth = 1;
    for (var dx = 0.0; dx < width; dx += 6) {
      canvas.drawLine(
        Offset(dx, dy),
        Offset(math.min(dx + 3, width), dy),
        paint,
      );
    }

    final label = TextPainter(
      text: TextSpan(
        text: formatPrice(price),
        style: _axisStyle.copyWith(
          color: AppColors.TEXT_PRIMARY,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        width + 4,
        dy - label.height / 2 - 3,
        label.width + 12,
        label.height + 6,
      ),
      const Radius.circular(4),
    );
    canvas.drawRRect(rect, Paint()..color = color);
    label.paint(canvas, Offset(width + 10, dy - label.height / 2));
  }

  void _paintVolume(
    Canvas canvas,
    double slot,
    double Function(int) x,
    double top,
  ) {
    final maxVolume = candles.map((c) => c.volume).reduce(math.max);
    if (maxVolume <= 0) return;
    final barWidth = math.max(1.0, slot * 0.62);
    for (var i = 0; i < candles.length; i++) {
      final c = candles[i];
      final height = c.volume / maxVolume * volumeHeight;
      final color = c.close >= c.open ? AppColors.RISE : AppColors.FALL;
      canvas.drawRect(
        Rect.fromLTWH(
          x(i) - barWidth / 2,
          top + volumeHeight - height,
          barWidth,
          height,
        ),
        Paint()..color = color.withValues(alpha: 0.45),
      );
    }
    _text(canvas, '거래량', Offset(slot * candles.length + 10, top));
  }

  void _paintTimeLabels(
    Canvas canvas,
    double width,
    double top,
    double Function(int) x,
  ) {
    final count = math.min(width >= 480 ? 5 : 3, candles.length);
    if (count < 2) return;
    final format = DateFormat(timePattern);
    for (var i = 0; i < count; i++) {
      final index = ((candles.length - 1) * i / (count - 1)).round();
      _text(
        canvas,
        format.format(candles[index].time),
        Offset(x(index), top),
        alignX: i == 0 ? 0 : (i == count - 1 ? 1 : 0.5),
        maxX: width,
      );
    }
  }

  /// [alignX]·[alignY] 0 = 왼쪽/위, 1 = 오른쪽/아래 기준.
  void _text(
    Canvas canvas,
    String text,
    Offset at, {
    double alignX = 0,
    double alignY = 0,
    double? maxX,
  }) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: _axisStyle),
      textDirection: TextDirection.ltr,
    )..layout();
    var dx = at.dx - painter.width * alignX;
    if (maxX != null) dx = dx.clamp(0, math.max(0, maxX - painter.width));
    painter.paint(canvas, Offset(dx, at.dy - painter.height * alignY));
  }

  @override
  bool shouldRepaint(CandleChartPainter oldDelegate) =>
      oldDelegate.candles != candles ||
      oldDelegate.mode != mode ||
      oldDelegate.timePattern != timePattern ||
      oldDelegate.currentPrice != currentPrice ||
      oldDelegate.changeRate != changeRate;
}
