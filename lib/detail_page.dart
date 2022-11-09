import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                          const Text(
                            "Tanjungsiang, Subang",
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
                    SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Senin, 20 Desember 2021 - 3.30 PM",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Image.asset("assets/partly_cloudy.png"),
                    const Text(
                      "18º C",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    const Text(
                      "Hujan Berawan",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Terakhir update 3.00 PM",
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16),
              child: Container(
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
              child: Container(
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
                          Container(
                            width: 60,
                            height: 60,
                            child: Image.asset("assets/partly_cloudy.png"),
                          ),
                          const Text(
                            "20º",
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
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16),
              child: Container(
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
                  padding: EdgeInsets.only(left: 20),
                  height: 150,
                  child: Row(
                    children: [
                      Container(
                        // color: Colors.amber,
                        width: 80,
                        height: 80,
                        child: Stack(
                          children: [
                            Center(
                                child: Text(
                              "12",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 24),
                            )),
                            Center(
                              child: Container(
                                //color: Colors.yellow,
                                height: 90,
                                width: 120,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.grey.withOpacity(.5),
                                  color: Colors.green[600],
                                  value: .12,
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
          ],
        ),
      ),
    );
  }
}
