import 'package:cloudwalkone/app/core/stores/settings/settings_store.dart';
import 'package:cloudwalkone/app/modules/weather/widgets/weather_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_module/module/module.dart';
import 'weather_detail_controller.dart';

class WeatherDetailPage extends StatefulWidget {
  const WeatherDetailPage(
      {super.key, required this.controller, required this.id});
  final WeatherDetailController controller;
  final num id;
  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  @override
  void initState() {
    widget.controller.init(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedBuilder(
          animation: widget.controller.weather,
          builder: (context,w) {
            if(widget.controller.weather.value == null) return const SizedBox();
            return Text(
              widget.controller.weather.value!.city!.name!,
              style: Theme.of(context).textTheme.titleSmall,
            );
          }
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: AnimatedBuilder(
                animation: ModularSinglito.get<SettingsStore>().isDark,
                builder: (context, w) {
                  return GestureDetector(
                    onTap: () {
                      ModularSinglito.get<SettingsStore>().changeTheme();
                    },
                    child: ModularSinglito.get<SettingsStore>().isDark.value
                        ? const Icon(
                            Icons.sunny,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.nightlight_sharp,
                            color: Colors.black,
                          ),
                  );
                }),
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return AnimatedBuilder(
      animation: widget.controller.listLoaded,
      builder: (context, child) {
        if (widget.controller.listWeather.value.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.controller.listWeather.value.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: SizedBox(
                height: 130.h,
                child: Card(
                  surfaceTintColor: Theme.of(context).colorScheme.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.w,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: WeatherTileWidget(
                      date: widget
                          .controller.listWeather.value[index].date!,
                      icon: widget.controller.listWeather.value[index].weather![0].icon!,
                      temp: widget.controller.listWeather.value[index]
                          .main!.temp!,
                      tempMax: widget.controller.listWeather.value[index]
                         .main!.tempMax!,
                      tempMin: widget.controller.listWeather.value[index]
                          .main!.tempMin!,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
