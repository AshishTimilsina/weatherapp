import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapp/services/weather_service.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(weatherserviceprovider);
    return SafeArea(
      child: Scaffold(
          body: data.when(
              data: (data) {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/back.jpg'),
                                fit: BoxFit.cover)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 2),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'current status: ${data[index].description!}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'country:${data[index].country!}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'placename:${data[index].placename}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'latitude:${data[index].latitude}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'longitude:${data[index].longitude}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'temperature:${data[index].temp}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'wind:${data[index].wind} m/s',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Humidity:${data[index].humidity}%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              error: (error, _) {
                return Text(error.toString());
              },
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))),
    );
  }
}
