import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

// this is the model of how the chart works
class ProduceTimeline {
  //model for chart
  final String months;
  final int quantity;
// sets color
  final charts.Color barColor;

  ProduceTimeline({
    required this.months,
    required this.quantity,
    required this.barColor,
  });
}
