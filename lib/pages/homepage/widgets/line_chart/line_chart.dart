import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:currency_app/models/chart_coordinator_model.dart';

class CurrencyChart extends StatelessWidget {
  final double maxX;
  final double maxY;
  final double minX;
  final double minY;
  final List<CoordinatorModel> spots;
  final List<Color> gradientColors;

  const CurrencyChart({
    Key key,
    this.maxX,
    this.maxY,
    this.minX = 1,
    this.minY,
    this.spots,
    this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          color: Color(0xff232d37),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 24.0, 18, 20),
          child: LineChart(_mainData()),
        ),
      ),
    );
  }

  _mainData() {
    return LineChartData(
      gridData: _buildChartGrid(),
      lineBarsData: _buildData(),
      titlesData: _buildChartTitles(),
      maxX: maxX,
      minX: minX,
      maxY: maxY,
      minY: minY,
    );
  }

  FlTitlesData _buildChartTitles() {
    return FlTitlesData(
      show: true,
      leftTitles: _buildLeftTitles(),
      bottomTitles: _buildBottomTitles(),
    );
  }

  FlGridData _buildChartGrid() {
    return FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 0.2,
      verticalInterval: 2,
      getDrawingHorizontalLine: (value) => _getLine(value),
      getDrawingVerticalLine: (value) => _getLine(value),
    );
  }

  SideTitles _buildLeftTitles() {
    return SideTitles(
      reservedSize: 30,
      showTitles: true,
      getTextStyles: (value) => _getTextStyles(value),
      getTitles: (value) {
        if (value == minY) return minY.toString();
        if (value == maxY) return maxY.toString();
        return '';
      },
    );
  }

  SideTitles _buildBottomTitles() {
    return SideTitles(
      showTitles: true,
      reservedSize: 10,
      getTextStyles: (value) => _getTextStyles(value),
      getTitles: (value) {
        if (value == 16) return '15 days ago';
        if (value == 30) return 'Now';
        return '';
      },
    );
  }

  _getLine(value) {
    return FlLine(
      color: const Color(0xff37434d),
      strokeWidth: 1,
    );
  }

  _getTextStyles(value) {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
  }

  _buildData() {
    final listSpots = spots.map((item) => FlSpot(item.x, item.y)).toList();
    return [
      LineChartBarData(
        spots: listSpots.isEmpty ? [FlSpot(0, 0), FlSpot(0, 0)] : listSpots,
        isCurved: true,
        colors: gradientColors,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      )
    ];
  }
}
