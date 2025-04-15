import 'package:flutter/material.dart';
import 'package:jioyathri/features/services/deal.dart';
import 'package:jioyathri/features/services/presentation/pages/error_message.dart';
import 'package:jioyathri/features/services/presentation/widgets/headings.dart';
import '../widgets/deal_card.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  List<Widget> dashboarditems = [
    Services(),
    ErrorMessage(),
    ErrorMessage(),
    ErrorMessage(),
    ErrorMessage(),
  ];

  final _currentindex = 0;
  final List<Deal> deals = [
    Deal(
      'Car interior cleaning',
      '50% off',
      Icons.directions_car,
      'https://i.pinimg.com/736x/96/ab/80/96ab80996d607681156c134d54ff16fb.jpg',
    ),
    Deal(
      'Personal fitness trainer',
      '30% off',
      Icons.fitness_center,
      'https://i.pinimg.com/736x/6a/51/48/6a5148865af35a971ca7b864994f9d88.jpg',
    ),
    Deal(
      'Pet grooming',
      '20% off',
      Icons.pets,
      'https://i.pinimg.com/736x/0f/f2/7e/0ff27ee861fb994cfd26f2e09cd9ab25.jpg',
    ),
    Deal(
      'Home cleaning',
      '40% off',
      Icons.cleaning_services,
      'https://i.pinimg.com/736x/ed/38/66/ed38663596cc2b9472742b68c40b455b.jpg',
    ),
    Deal(
      'Restaurant discount',
      '15% off',
      Icons.restaurant,
      'https://i.pinimg.com/736x/f7/60/68/f76068015b6418656177919092d0a094.jpg',
    ),
  ];

  final List<Deal> servicesnearyou = [
    Deal(
      'Laundry & Dry Cleaning',
      '30% off',
      Icons.local_laundry_service,
      'https://i.pinimg.com/736x/b9/ef/8d/b9ef8d7bfc38fdaf5c76d8f7110599e6.jpg',
    ),
    Deal(
      'Massage Therapist',
      '50% off',
      Icons.spa,
      'https://i.pinimg.com/736x/f6/33/48/f6334826491861572c8e532a6a099cdc.jpg',
    ),
    Deal(
      'Gardening Services',
      '40% off',
      Icons.grass,
      'https://i.pinimg.com/736x/38/d4/2f/38d42f1968bf8b6be5d3c069c7d949b8.jpg',
    ),
  ];

  final List<Deal> yourbookings = [
    Deal(
      'AC Repair & Service',
      '25% off',
      Icons.ac_unit,
      'https://i.pinimg.com/736x/04/5f/49/045f49d5fee9500e5b1b3c275823570d.jpg',
    ),
    Deal(
      'Electrician On-Demand',
      '10% off',
      Icons.electrical_services,
      'https://i.pinimg.com/736x/70/d2/a5/70d2a5bfb09edcb66b7507e1a3e199ec.jpg',
    ),
    Deal(
      'Beauty Salon at Home',
      '35% off',
      Icons.brush,
      'https://i.pinimg.com/736x/53/08/05/530805744a6f5d578b9f89a449e16903.jpg',
    ),
    Deal(
      'Mobile Phone Repair',
      '20% off',
      Icons.phone_android,
      'https://i.pinimg.com/736x/86/89/9d/86899df435a469690f7230684792299b.jpg',
    ),
    Deal(
      'Plumber Services',
      '15% off',
      Icons.plumbing,
      'https://i.pinimg.com/736x/c4/36/65/c436656b64c3748515657197edd25d7c.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).viewPadding;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, padding.top + 10, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 20),
              const Heading(title: 'Recommendations for you'),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: deals.length,
                  itemBuilder: (context, index) {
                    return DealCard(deal: deals[index]);
                  },
                ),
              ),

              const Heading(title: 'Services Near you'),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: servicesnearyou.length,
                  itemBuilder: (context, index) {
                    return DealCard(deal: servicesnearyou[index]);
                  },
                ),
              ),

              const Heading(title: 'your bookings'),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: yourbookings.length,
                  itemBuilder: (context, index) {
                    return DealCard(deal: yourbookings[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Location',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 4),
            Row(
              children: const [
                Icon(Icons.near_me, color: Colors.blueAccent, size: 18),
                SizedBox(width: 6),
                Text(
                  'No. 28, Tempostand Road',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(51),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/male.png'),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
          hintText: 'Search for services...',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
