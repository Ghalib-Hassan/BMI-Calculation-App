import 'package:bmi_calculator/Screens/calculate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _currentHeight = 170;
  int weight = 50;
  int age = 20;

  void weightDecrement() async {
    setState(() {
      if (weight > 0) {
        weight -= 1;
      }
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('weight', weight);
  }

  void weightDecrementLong() async {
    setState(() {
      if (weight > 20) {
        weight -= 20;
      } else if (weight <= 20) {
        weight = -1;
      } else if (weight == 0) {
        weight -= 0;
      }
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('weight', weight);
  }

  void weightIncrement() async {
    setState(() {
      weight += 1;
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('weight', weight);
  }

  void weightIncrementLong() async {
    setState(() {
      weight += 10;
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('weight', weight);
  }

  void ageDecrement() async {
    setState(() {
      if (age > 0) {
        age -= 1;
      }
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('age', age);
  }

  void ageDecrementLong() async {
    setState(() {
      if (age > 20) {
        age -= 20;
      } else if (age <= 20) {
        age = -1;
      } else if (age == 0) {
        age -= 0;
      }
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('age', age);
  }

  void ageIncrement() async {
    setState(() {
      age += 1;
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('age', age);
  }

  void ageIncrementLong() async {
    setState(() {
      age += 10;
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('age', age);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x1A1F38).withOpacity(.3),
      appBar: AppBar(
        backgroundColor: const Color(0x1A1F38).withOpacity(1),
        title: Text(
          'BMI Calculator',
          style: GoogleFonts.almarai(
            fontSize: 50,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                height: 130,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0x1A1F38).withOpacity(1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.female,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        'Female',
                        style: GoogleFonts.mada(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                width: 150,
                height: 130,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0x1A1F38).withOpacity(1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.male,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        'Male',
                        style: GoogleFonts.mada(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Container(
            width: 350,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0x1A1F38).withOpacity(1),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Height',
                  style: GoogleFonts.mada(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${_currentHeight.toStringAsFixed(1)} cm',
                  style: GoogleFonts.mada(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Slider(
                  value: _currentHeight,
                  min: 100,
                  max: 250,
                  divisions: 150,
                  activeColor: Colors.red,
                  inactiveColor: Colors.white,
                  label: _currentHeight.round().toString(),
                  onChanged: (double newValue) async {
                    setState(() {
                      _currentHeight = newValue;
                    });

                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setDouble('height', _currentHeight);
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 150,
                height: 130,
                decoration: BoxDecoration(
                    color: Color(0x1A1F38).withOpacity(1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text('Weight',
                        style: GoogleFonts.mada(
                          color: Colors.white,
                          fontSize: 30,
                        )),
                    Text(weight.toString(),
                        style: GoogleFonts.mada(
                          color: Colors.white,
                          fontSize: 30,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            weightDecrement();
                          },
                          onLongPress: () {
                            weightDecrementLong();
                          },
                          child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.minus,
                                  size: 30,
                                ),
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            weightIncrement();
                          },
                          onLongPress: () {
                            weightIncrementLong();
                          },
                          child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: Icon(
                                Icons.add,
                                size: 30,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: 150,
                height: 130,
                decoration: BoxDecoration(
                    color: Color(0x1A1F38).withOpacity(1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text('Age',
                        style: GoogleFonts.mada(
                          color: Colors.white,
                          fontSize: 30,
                        )),
                    Text(age.toString(),
                        style: GoogleFonts.mada(
                          color: Colors.white,
                          fontSize: 30,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            ageDecrement();
                          },
                          onLongPress: () {
                            ageDecrementLong();
                          },
                          child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.minus,
                                  size: 30,
                                ),
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            ageIncrement();
                          },
                          onLongPress: () {
                            ageIncrementLong();
                          },
                          child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: const Icon(
                                Icons.add,
                                size: 30,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 120,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(400, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.red),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Calculate()));
            },
            child: Text(
              'Calculate',
              style: GoogleFonts.fondamento(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
