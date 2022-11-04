import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/grafik_kehadiran_controller.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GrafikKehadiranView extends GetView<GrafikKehadiranController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Kehadiran'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: chartKehadiram(),
        ),
      ),
    );
  }

  Widget chartKehadiram() {
    var series = [
      charts.Series(
          domainFn: (Sales sales, _) => sales.day,
          measureFn: (Sales sales, _) => sales.sold,
          id: "Sales",
          data: controller.data.value)
    ];
    return charts.BarChart(
      series,
      vertical: false,
    );
  }

  Widget tableKehadiran() {
    return Container();
  }
}

class Sales {
  final String day;
  final int sold;
  Sales(this.day, this.sold);
}
