import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

import 'cubits/get_weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  useMaterial3: true,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(
                        context,
                      ).weatherModel?.weatherState,
                    ),
                    primary: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(
                        context,
                      ).weatherModel?.weatherState,
                    ),
                  ),
                  appBarTheme: AppBarTheme(
                    backgroundColor: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(
                        context,
                      ).weatherModel?.weatherState,
                    ),
                    foregroundColor: Colors.white,
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? weatherState) {
  if (weatherState == null) {
    return Colors.blue;
  }
  if (weatherState == 'Sunny') {
    return Colors.orange;
  } else if (weatherState == 'Clear') {
    return Colors.amber;
  } else if (weatherState == 'Partly cloudy') {
    return Colors.lightBlue;
  } else if (weatherState == 'Cloudy' || weatherState == 'Overcast') {
    return Colors.blueGrey;
  } else if (weatherState == 'Mist' ||
      weatherState == 'Fog' ||
      weatherState == 'Freezing fog') {
    return Colors.blueGrey;
  } else if (weatherState == 'Haze' ||
      weatherState == 'Smoky haze' ||
      weatherState == 'Smoke' ||
      weatherState == 'Smog' ||
      weatherState == 'Severe smog') {
    return Colors.grey;
  } else if (weatherState == 'Dust haze' ||
      weatherState == 'Blowing dust' ||
      weatherState == 'Dust storm' ||
      weatherState == 'Sandstorm' ||
      weatherState == 'Severe sandstorm' ||
      weatherState == 'Saharan dust' ||
      weatherState == 'Dust') {
    return Colors.brown;
  } else if (weatherState == 'Patchy rain possible' ||
      weatherState == 'Patchy light drizzle' ||
      weatherState == 'Light drizzle' ||
      weatherState == 'Patchy light rain' ||
      weatherState == 'Light rain' ||
      weatherState == 'Light rain shower') {
    return Colors.lightBlue;
  } else if (weatherState == 'Moderate rain at times' ||
      weatherState == 'Moderate rain' ||
      weatherState == 'Heavy rain at times' ||
      weatherState == 'Heavy rain' ||
      weatherState == 'Moderate or heavy rain shower' ||
      weatherState == 'Torrential rain shower') {
    return Colors.blue;
  } else if (weatherState == 'Patchy freezing drizzle possible' ||
      weatherState == 'Freezing drizzle' ||
      weatherState == 'Heavy freezing drizzle' ||
      weatherState == 'Light freezing rain' ||
      weatherState == 'Moderate or heavy freezing rain') {
    return Colors.teal;
  } else if (weatherState == 'Patchy sleet possible' ||
      weatherState == 'Light sleet' ||
      weatherState == 'Moderate or heavy sleet' ||
      weatherState == 'Light sleet showers' ||
      weatherState == 'Moderate or heavy sleet showers' ||
      weatherState == 'Ice pellets' ||
      weatherState == 'Light showers of ice pellets' ||
      weatherState == 'Moderate or heavy showers of ice pellets') {
    return Colors.cyan;
  } else if (weatherState == 'Patchy snow possible' ||
      weatherState == 'Blowing snow' ||
      weatherState == 'Blizzard' ||
      weatherState == 'Patchy light snow' ||
      weatherState == 'Light snow' ||
      weatherState == 'Patchy moderate snow' ||
      weatherState == 'Moderate snow' ||
      weatherState == 'Patchy heavy snow' ||
      weatherState == 'Heavy snow' ||
      weatherState == 'Light snow showers' ||
      weatherState == 'Moderate or heavy snow showers') {
    return Colors.indigo;
  } else if (weatherState == 'Thundery outbreaks possible' ||
      weatherState == 'Patchy light rain with thunder' ||
      weatherState == 'Moderate or heavy rain with thunder' ||
      weatherState == 'Patchy light snow with thunder' ||
      weatherState == 'Moderate or heavy snow with thunder') {
    return Colors.deepPurple;
  } else {
    return Colors.blue;
  }
}
