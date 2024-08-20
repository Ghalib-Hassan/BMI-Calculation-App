import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  String level = '';
  String msg = '';
  double bmi = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int weight = sp.getInt('weight') ?? 0;
    double height = sp.getDouble('height') ?? 0;

    double newHeight = height / 100;
    bmi = weight / (newHeight * newHeight);

    setState(() {
      if (bmi < 18.5) {
        level = 'Underweight';
        msg = 'You are underweight. Consider a balanced diet.';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        level = 'Normal';
        msg = "Great! You have a normal body weight.";
      } else if (bmi >= 25 && bmi < 29.9) {
        level = 'Overweight';
        msg = 'You are overweight. Regular exercise is recommended.';
      } else if (bmi >= 30) {
        level = 'Obese';
        msg = 'You are obese. Consult a healthcare provider.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x1A1F38).withOpacity(.3),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0x1A1F38).withOpacity(1),
        title: Text(
          'Your Result',
          style: GoogleFonts.almarai(color: Colors.white, fontSize: 40),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
              color: const Color(0x1A1F38).withOpacity(1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                level,
                style: GoogleFonts.caesarDressing(
                    color: Colors.greenAccent, fontSize: 50),
              ),
              Text(
                bmi.toStringAsFixed(2),
                style: GoogleFonts.labrada(color: Colors.white, fontSize: 60),
              ),
              Text(
                msg,
                textAlign: TextAlign.center,
                style:
                    GoogleFonts.zenAntique(color: Colors.white, fontSize: 35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
