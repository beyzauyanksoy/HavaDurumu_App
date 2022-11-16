// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

import 'detail_show_case.dart';
import 'providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list = ['Tanjungsiang, Subang', 'İstanbul', 'Ankara', 'İzmir'];
  String dropdownValue = 'Tanjungsiang, Subang';

  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  WeatherProvider? wetProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wetProvider = Provider.of<WeatherProvider>(context, listen: false);
    wetProvider!.getWeatherData();
    wetProvider!.getClockData();
    someEvent();
  }

  someEvent() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
          Duration(
            seconds: 1,
          ), () {
        return ShowCaseWidget.of(context).startShowCase([_one, _two]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Showcase(
                          description: 'Konum bilgisini ayarlayabilirsiniz',
                          key: _one,
                          child: Container(
                            width: 220,
                            //color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/location.png"),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: dropdownValue,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    elevation: 16,
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownValue = value!;
                                      });
                                    },
                                    items: list.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 47,
                          height: 47,
                          // color: Colors.blue,
                          child: const Icon(Icons.search),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailShowCase()),
                      );
                    },
                    child: Consumer<WeatherProvider>(
                      builder: (BuildContext context, provider, Widget? child) {
                        return provider.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Container(
                                width: 340,
                                height: 190,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color(0xff4F7FFA),
                                      Color(0xff335FD1)
                                    ])),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 18, right: 18),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FadeInDown(
                                            duration: Duration(seconds: 1),
                                            child: Text(
                                             provider.nowDate.split(" ").first.substring(0,10),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          FadeInUp(
                                            duration: Duration(seconds: 2),
                                            child: Text(
                                            provider.nowClock.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25),
                                      child: Container(
                                        child: FadeInLeft(
                                          duration: Duration(seconds: 1),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  "assets/partly_cloudy.png"),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 40),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 98,
                                                      ),
                                                      child: Showcase(
                                                        key: _two,
                                                        description:
                                                            'dereceyi buradan görüntüleyebilirsiniz',
                                                        child: Text(
                                                          "${double.parse(provider.response?.main?.temp.toString() ?? "0")}°C",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      provider.response?.weather
                                                              ?.first.main ??
                                                          "",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: Container(
                                        //color: Colors.amber,
                                        // width: MediaQuery.of(context).size.width,
                                        child: FadeInUp(
                                          duration: Duration(seconds: 1),
                                          child: Row(
                                            children: [
                                              Text(
                                                provider.response?.name ?? "",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8),
                                                child: Icon(
                                                  Icons.refresh,
                                                  color: Colors.white,
                                                  size: 18,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20, bottom: 10),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "Cuaca Per Jam",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                ),
                Consumer<WeatherProvider>(
                  builder:
                      (BuildContext context, clockProvider, Widget? child) {
                    return SizedBox(
                      //color: Colors.amber,
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            clockProvider.clockResponse?.list?.length ?? 0,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              clockProvider.nowClock=clockProvider
                                            .clockResponse?.list?[index].dtTxt
                                            ?.split(" ")
                                            .last
                                            .substring(0, 5) ??
                                        "";
                                        clockProvider.nowDate=clockProvider.clockResponse!.list![index].dtTxt.toString();
                              clockProvider.response?.weather?.first.main =
                                  clockProvider.clockResponse?.list?[index]
                                          .weather?.first.main ??
                                      "";
                              clockProvider.response?.dt =
                                  clockProvider.clockResponse?.list?[index].dt;
                              clockProvider.response?.main?.temp = clockProvider
                                  .clockResponse?.list?[index].main?.temp;
                              clockProvider.notifyListeners();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 80,
                                // color: Colors.red,
                                color: const Color(0xffFBFBFB),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Image.asset(
                                        "assets/partly_cloudy.png",
                                        width: 55,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 0, bottom: 10),
                                      child: Text(
                                          "${clockProvider.clockResponse?.list?[index].main?.temp ?? ""}"),
                                    ),
                                    Text(clockProvider
                                            .clockResponse?.list?[index].dtTxt
                                            ?.split(" ")
                                            .last
                                            .substring(0, 5) ??
                                        "")
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 3, top: 10),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Harian",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Stack(
                    children: [
                      Image.asset("assets/pinkgroup.png"),
                      Positioned(
                          top: 31,
                          left: 20,
                          child: Image.asset("assets/heavy-showers-line.png")),
                      Positioned(
                        top: 18,
                        left: 65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cuaca esok hari kemungkinan\nakan terjadi hujan di siang hari',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text('Jangan lupa bawa payung ya'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 18, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffD2DFFF),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              //color: Colors.amber,
                              width: 170,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      //borderRadius: BorderRadius.circular(25),
                                      color: Color(0xff9ab5ff),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Image.asset(
                                        "assets/partly_cloudy.png",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Selasa',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text('Hujan petir'),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: SizedBox(
                                //color: Colors.blueGrey,
                                width: 75,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "19º C",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                    Icon(Icons.arrow_right),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            )),
      ),
    );
  }
}
// "${provider.response?.sys?.country ?? ""}, ${DateTime.fromMillisecondsSinceEpoch(provider.response?.dt).day}/${DateTime.fromMillisecondsSinceEpoch(provider.response?.dt).month}/${DateTime.fromMillisecondsSinceEpoch(provider.response?.dt).year}"