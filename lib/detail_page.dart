import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

import 'providers/weather_provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    someEvent();
  }

  someEvent() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
          const Duration(
            seconds: 1,
          ), () {
        return ShowCaseWidget.of(context).startShowCase([
          _one,
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<WeatherProvider>(
              builder: (BuildContext context, provider, Widget? child) {
                return Container(
                  width: double.infinity,
                  height: 370,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff4F7FFA),
                          Color(0xff335FD1),
                        ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, right: 16),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                   Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              ),
                              Text(
                                provider.response?.name ?? "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Icon(
                                Icons.more_horiz_outlined,
                                color: Colors.white,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FadeInDown(
                          duration: const Duration(seconds: 1),
                          child: Text(
                            "${provider.response?.sys?.country ?? ""}, ${DateTime.fromMillisecondsSinceEpoch(provider.response?.dt).day}/${DateTime.fromMillisecondsSinceEpoch(provider.response?.dt).month}/${DateTime.fromMillisecondsSinceEpoch(provider.response?.dt).year}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        FadeInDown(
                            duration: const Duration(seconds: 2),
                            child: Image.asset("assets/partly_cloudy.png")),
                        FadeInRight(
                          duration: const Duration(seconds: 2),
                          child: Showcase(
                            description: 'Dereceye buradan bakabilirsiniz.',
                            key: _one,
                            child: Text(
                              "${double.parse(provider.response?.main?.temp.toString() ?? "0")}??C",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        FadeInLeft(
                          duration: const Duration(seconds: 2),
                          child: Text(
                            provider.response?.weather?.first.main ?? "",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${provider.response?.name ?? ""} ${DateTime.fromMillisecondsSinceEpoch(provider.response?.dt).hour}:${DateTime.fromMillisecondsSinceEpoch(provider.response?.dt).minute}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.refresh,
                              size: 18,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24, left: 16),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Cuaca Per Jam",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
              child: SizedBox(
                height: 110,
                // color: Colors.blue,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      width: 78.0,
                      decoration: BoxDecoration(
                          color: const Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(6)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: Image.asset("assets/partly_cloudy.png"),
                          ),
                          const Text(
                            "20??",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            "4.00 PM",
                            style: TextStyle(
                                color: Color(0xff494343),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24, left: 16),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Detail Informasi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            //
            Stack(
              children: [
                Container(
                  //color: Colors.red,
                  padding: const EdgeInsets.only(left: 20),
                  height: 150,
                  child: Row(
                    children: [
                      SizedBox(
                        // color: Colors.amber,
                        width: 80,
                        height: 80,
                        child: Stack(
                          children: [
                            const Center(
                                child: Text(
                              "12",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 24),
                            )),
                            Center(
                              child: SizedBox(
                                //color: Colors.yellow,
                                height: 90,
                                width: 120,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.grey.withOpacity(.5),
                                  color: Colors.green[600],
                                  value: 0.12,
                                  strokeWidth: 7,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'AQI - Sangat Baik',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        'Kualitas udara di daerahmu untuk saat ini\nsangat baik. Tidak ada pencemaran udara\nyang menyebabkan berbagai penyakit.',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              ],
            ),
            GridView.builder(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3,
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 12.0,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Image.asset("assets/smallicon.png"),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('86%'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Kelembaban'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
