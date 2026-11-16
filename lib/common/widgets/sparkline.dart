import 'package:flutter/material.dart';

/// 작은 추이선. 표의 7일 추이 칸에 쓴다.
class Sparkline extends StatelessWidget {
  const Sparkline({
    super.key,
    required this.values,
    required this.color,
    this.width = 96,
    this.height = 32,
  });

  final List<double> values;
  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: CustomPaint(
        size: Size(width, height),
        painter: LineChartPainter(
          values: values,
          color: color,
          strokeWidth: 1.6,
        ),
      ),
    );
  }
}

/// 가격 추이 영역 차트. 선 아래를 색으로 옅게 채운다.
class PriceAreaChart extends StatelessWidget {
  const PriceAreaChart({
    super.key,
    required this.values,
    required this.color,
    this.height = 260,
    this.semanticLabel = '가격 추이 차트',
  });

  final List<double> values;
  final Color color;
  final double height;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: CustomPaint(
        size: Size(double.infinity, height),
        painter: LineChartPainter(
          values: values,
          color: color,
          strokeWidth: 2,
          fill: true,
        ),
      ),
    );
  }
}

/// Sparkline / PriceAreaChart 공용 페인터.
class LineChartPainter extends CustomPainter {
  LineChartPainter({
    required this.values,
    required this.color,
    required this.strokeWidth,
    this.fill = false,
  });

  final List<double> values;
  final Color color;
  final double strokeWidth;
  final bool fill;

  @override
  void paint(Canvas canvas, Size size) {
    if (values.length < 2) return;

    final min = values.reduce((a, b) => a < b ? a : b);
    final max = values.reduce((a, b) => a > b ? a : b);
    final span = (max - min) == 0 ? 1.0 : max - min;
    final pad = strokeWidth * 2;
    final dx = size.width / (values.length - 1);

    final line = Path();
    for (var i = 0; i < values.length; i++) {
      final x = i * dx;
      final y = pad + (1 - (values[i] - min) / span) * (size.height - pad * 2);
      i == 0 ? line.moveTo(x, y) : line.lineTo(x, y);
    }

    if (fill) {
      final area = Path.from(line)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close();
      canvas.drawPath(
        area,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color.withValues(alpha: 0.22), color.withValues(alpha: 0)],
          ).createShader(Offset.zero & size),
      );
    }

    canvas.drawPath(
      line,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(LineChartPainter oldDelegate) =>
      oldDelegate.values != values ||
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.fill != fill;
}
