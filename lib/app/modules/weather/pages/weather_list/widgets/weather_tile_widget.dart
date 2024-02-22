import 'package:conversion_units/conversion_units.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherTileWidget extends StatelessWidget {
  const WeatherTileWidget(
      {super.key,
      required this.cityName,
      required this.icon,
      required this.temp,
      required this.tempMax,
      required this.tempMin});
  final String cityName;
  final String icon;
  final num temp;
  final num tempMax;
  final num tempMin;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(cityName),
              Expanded(
                child: Lottie.asset(icon),
              ),
            ],
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Temp.",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              "${Kelvin.toCelsius(temp.toDouble()).ceil().toString()}C°",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        )),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: tempMinMax(context,
                  isMax: true,
                  temp: "${Kelvin.toCelsius(tempMax.toDouble()).ceil().toString()}C°"),
            ),
            Expanded(
              child: tempMinMax(context,
                  isMax: false,
                  temp: "${Kelvin.toCelsius(tempMin.toDouble()).ceil().toString()}C°"),
            ),
          ],
        ))
      ],
    );
  }

  Widget tempMinMax(context, {required String temp, required bool isMax}) {
    String type = isMax ? "Max" : "Min";

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            temp,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Expanded(
          child: Text(
            type,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
