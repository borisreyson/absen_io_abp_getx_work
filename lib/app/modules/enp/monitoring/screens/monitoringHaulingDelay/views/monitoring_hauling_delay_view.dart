import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/monitoring_hauling_delay_controller.dart';

class MonitoringHaulingDelayView
    extends GetView<MonitoringHaulingDelayController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MonitoringHaulingDelayView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MonitoringHaulingDelayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
