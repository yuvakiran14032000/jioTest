import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final List<Deal> deals = [
    Deal('Car interior cleaning', '50% off', Icons.directions_car),
    Deal('Personal fitness trainer', '30% off', Icons.fitness_center),
    Deal('Pet grooming', '20% off', Icons.pets),
    Deal('Home cleaning', '40% off', Icons.cleaning_services),
    Deal('Restaurant discount', '15% off', Icons.restaurant),
  ];
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).viewPadding;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(12, padding.top, 12, 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'your location',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 65, 65, 65),
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 5,
                      children: [
                        Icon(Icons.near_me, color: Colors.blueAccent, size: 20),
                        Text(
                          'no.28, Tempostand Road..',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    shape:
                        BoxShape.circle, // This matches the CircleAvatar shape
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black, //visible shadow color
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset: Offset(
                          0,
                          3,
                        ), // Positive Y offset puts shadow at bottom
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/male.png'),
                    radius: 25,
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Card(
              borderOnForeground: true,
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 40,
                    ), // Controls icon spacing
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.search),
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Heading(title: 'Recomendations for you'),
            SizedBox(
              height: 180, // Fixed height for the scrollable area
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: deals.length,
                itemBuilder: (context, index) {
                  return DealCard(deal: deals[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  final String title;
  const Heading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right, size: 25)),
      ],
    );
  }
}

class Deal {
  final String title;
  final String discount;
  final IconData icon;

  Deal(this.title, this.discount, this.icon);
}

class DealCard extends StatelessWidget {
  final Deal deal;

  const DealCard({Key? key, required this.deal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Fixed width for each card
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset('assets/images/gym.jpg', fit: BoxFit.cover),
      ),
    );
  }
}
