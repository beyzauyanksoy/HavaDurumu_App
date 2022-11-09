import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> list = <String>[
  'Tanjungsiang, Subang',
  'İstanbul',
  'Ankara',
  'İzmir'
];

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Tanjungsiang, Subang';

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
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 220,
                        // color: Colors.amber,
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
                      Container(
                          width: 47,
                          height: 47,
                          //color: Colors.blue,
                          child: const Icon(Icons.search))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: 340,
                  height: 190,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [Color(0xff4F7FFA), Color(0xff335FD1)])),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 18, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Senin, 20 Desember 2021",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Text(
                              "3.30 PM",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          child: Row(
                            children: [
                              Image.asset("assets/partly_cloudy.png"),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 40),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 98,
                                      ),
                                      child: Text(
                                        "18°C",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    Text(
                                      "Hujan Berawan",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Container(
                          //color: Colors.amber,
                          // width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: const [
                              Text(
                                "Terakhir update 3.00 PM",
                                style: TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20, bottom: 10),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Cuaca Per Jam",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )),
              ),
              Container(
                //color: Colors.amber,
                width: 350,
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 24,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 80,
                        color: Color(0xffFBFBFB),
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
                                  const EdgeInsets.only(top: 0, bottom: 10),
                              child: Text('20'),
                            ),
                            Text('4.00 PM')
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 3, top: 10),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Harian",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 18, right: 15),
                    child: Container(
                      decoration: BoxDecoration(
                             color: Color(0xffD2DFFF),
                             borderRadius: BorderRadius.circular(10)
                      ),
                     
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            //color: Colors.amber,
                            width: 170,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Selasa',style: TextStyle(fontWeight:FontWeight.w600 ,fontSize: 15),),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
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
                            child: Container(
                              //color: Colors.blueGrey,
                              width: 75,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("19º C",style: TextStyle(fontWeight:FontWeight.w600 ,fontSize: 14),),
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
          ),
        ),
      ),
    );
  }
}
