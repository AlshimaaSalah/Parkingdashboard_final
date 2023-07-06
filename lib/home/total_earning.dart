import 'package:flutter/material.dart';

class TotalEarning extends StatelessWidget {
  static const String routName = "money";
  double money = 14900;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage('assets/images/dash2.jpeg'), fit: BoxFit.fill)),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xB356544C),
              border: Border.all(color: Colors.black45),
              borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width * .7,
          height: MediaQuery.of(context).size.height * .4,
          margin: EdgeInsets.symmetric(horizontal: 25),
          padding: EdgeInsets.symmetric(vertical: 30),

          //child: Text('hello'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.money,
                color: Colors.white,
                size: 30,
              ),
              //SizedBox(height: 4,),

              Text(
                "$money LE",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),

              //SizedBox(height: 4,),

              Text(
                "Total Earning",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
