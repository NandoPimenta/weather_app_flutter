import 'package:cloudwalkone/app/core/stores/settings/settings_store.dart';
import 'package:cloudwalkone/app/widgets/custom_search_box/custom_search_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:package_module/module/module.dart';

import 'weather_list_controller.dart';
import '../../widgets/weather_tile_widget.dart';

class WeatherListPage extends StatefulWidget {
  const WeatherListPage({super.key, required this.controller});
  final WeatherListController controller;
  @override
  State<WeatherListPage> createState() => _WeatherListPageState();
}

class _WeatherListPageState extends State<WeatherListPage> {
  @override
  void initState() {
    widget.controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de Cidades",
          style: Theme.of(context).textTheme.titleSmall,
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
    return ListView(
      shrinkWrap: true,
      children: [
        AnimatedBuilder(
            animation: Listenable.merge([
              widget.controller.settingsStore.netWork,
              widget.controller.listLoaded
            ]),
            builder: (context, w) {
              if (!widget.controller.settingsStore.netWork.value) {
                return const SizedBox();
              }
              return SizedBox(
                height: 60.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: searchInput(),
                ),
              );
            }),
        AnimatedBuilder(
            animation: widget.controller.searchWeather,
            builder: (context, w) {
              if (widget.controller.searchWeather.value == null) {
                return const SizedBox();
              }
              return SizedBox(
                height: 140.h,
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: tileSearchWeatherAnimation(),
                ),
              );
            }),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(height: 140.h, child: tileWeatherAnimation()),
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: Text(
            "Outras cidades",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        AnimatedBuilder(
          animation: Listenable.merge([
            widget.controller.settingsStore.netWork,
            widget.controller.listLoaded
          ]),
          builder: (context, child) {
            if (widget.controller.listWeather.value.isEmpty) {
              if (!widget.controller.settingsStore.netWork.value) {
                return Lottie.asset("assets/lottie/nonet.json",height: 300.h,width: 200.w);
              }
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
                      surfaceTintColor:
                          Theme.of(context).colorScheme.background,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1.w,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: WeatherTileWidget(
                          onTap: () {
                            widget.controller.openDetail(
                                id: widget.controller.listWeather.value[index]
                                    .city!.id!);
                          },
                          cityName: widget
                              .controller.listWeather.value[index].city!.name!,
                          icon: widget.controller.listWeather.value[index]
                              .list![0].weather![0].icon!,
                          temp: widget.controller.listWeather.value[index]
                              .list![0].main!.temp!,
                          tempMax: widget.controller.listWeather.value[index]
                              .list![0].main!.tempMax!,
                          tempMin: widget.controller.listWeather.value[index]
                              .list![0].main!.tempMin!,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget searchInput() {
    return CustomSearchBoxWidget(
      textController: TextEditingController(),
      onChanged: widget.controller.onChange,
      btnAction: () {
        widget.controller.searchByCity(context);
      },
    );
  }

  Widget tileWeatherAnimation() {
    return Card(
      surfaceTintColor: Theme.of(context).colorScheme.background,
      child: AnimatedBuilder(
          animation: Listenable.merge([
            widget.controller.currentWeather,
            widget.controller.settingsStore.netWork
          ]),
          builder: (context, w) {
            if (widget.controller.currentWeather.value == null) {
              if (!widget.controller.settingsStore.netWork.value) {
                return const SizedBox();
              }
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }
            return WeatherTileWidget(
              onTap: () {
                widget.controller.openDetail(
                    id: widget.controller.currentWeather.value!.id!);
              },
              cityName: widget.controller.currentWeather.value!.name!,
              icon: widget.controller.currentWeather.value!.weather![0].icon!,
              temp: widget.controller.currentWeather.value!.main!.temp!,
              tempMax: widget.controller.currentWeather.value!.main!.tempMax!,
              tempMin: widget.controller.currentWeather.value!.main!.tempMin!,
            );
          }),
    );
  }

  Widget tileSearchWeatherAnimation() {
    return SizedBox(
      height: 130.h,
      child: Card(
        surfaceTintColor: Theme.of(context).colorScheme.background,
        child: AnimatedBuilder(
            animation: widget.controller.currentWeather,
            builder: (context, w) {
              if (widget.controller.currentWeather.value == null) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }
              return WeatherTileWidget(
                onTap: () {
                  widget.controller.openDetail(
                      id: widget.controller.searchWeather.value!.city!.id!);
                },
                cityName: widget.controller.searchWeather.value!.city!.name!,
                icon: widget
                    .controller.searchWeather.value!.list![0].weather![0].icon!,
                temp:
                    widget.controller.searchWeather.value!.list![0].main!.temp!,
                tempMax: widget
                    .controller.searchWeather.value!.list![0].main!.tempMax!,
                tempMin: widget
                    .controller.searchWeather.value!.list![0].main!.tempMin!,
              );
            }),
      ),
    );
  }
}
