import 'package:flutter/widgets.dart';
import 'weather_detail_controller.dart';

class WeatherDetailPage extends StatefulWidget {
  const WeatherDetailPage({super.key, required this.controller});
  final WeatherDetailController controller;
  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}