import 'package:flutter/material.dart';

void main() {
  runApp(const HizmetsonApp());
}

class HizmetsonApp extends StatelessWidget {
  const HizmetsonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hizmetson',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Hizmetson',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _LocationAndSearch(),
          const SizedBox(height: 24),
          const _QuickCategories(),
          const SizedBox(height: 24),
          const _SectionTitle(title: 'Popüler hizmetler'),
          const SizedBox(height: 12),
          _ServiceCardList(
            services: const [
              ServiceItem(
                title: 'Elektrik Arızası',
                description: 'Yetkili elektrikçi çağır',
                icon: Icons.bolt_outlined,
                color: Color(0xFFFFF3E0),
              ),
              ServiceItem(
                title: 'Nöbetçi Eczane',
                description: 'İlaç siparişi ver',
                icon: Icons.local_pharmacy_outlined,
                color: Color(0xFFE3F2FD),
              ),
              ServiceItem(
                title: 'Yemek Siparişi',
                description: 'Restoran ve paket servis',
                icon: Icons.restaurant_outlined,
                color: Color(0xFFE8F5E9),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const _SectionTitle(title: 'Yakındaki işletmeler'),
          const SizedBox(height: 12),
          _BusinessCardList(
            businesses: const [
              BusinessItem(
                name: 'Yıldız Elektrik',
                category: 'Elektrikçi',
                rating: 4.8,
                distance: '1.2 km',
              ),
              BusinessItem(
                name: 'Merkez Eczanesi',
                category: 'Eczane',
                rating: 4.6,
                distance: '750 m',
              ),
              BusinessItem(
                name: 'Lezzet Durağı',
                category: 'Restoran',
                rating: 4.4,
                distance: '500 m',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LocationAndSearch extends StatelessWidget {
  const _LocationAndSearch();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(
              Icons.location_on_outlined,
              size: 18,
            ),
            SizedBox(width: 4),
            Text(
              'Konum',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          'Sultanhanı, Aksaray',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Elektrikçi, eczane veya restoran ara...',
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class _QuickCategories extends StatelessWidget {
  const _QuickCategories();

  @override
  Widget build(BuildContext context) {
    final items = [
      _QuickItem(Icons.bolt_outlined, 'Elektrik'),
      _QuickItem(Icons.water_drop_outlined, 'Su / Tesisat'),
      _QuickItem(Icons.local_pharmacy_outlined, 'Eczane'),
      _QuickItem(Icons.restaurant_outlined, 'Yemek'),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items
          .map(
            (e) => Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(e.icon),
                ),
                const SizedBox(height: 8),
                Text(
                  e.label,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

class _QuickItem {
  final IconData icon;
  final String label;

  _QuickItem(this.icon, this.label);
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ServiceItem {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const ServiceItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class _ServiceCardList extends StatelessWidget {
  final List<ServiceItem> services;

  const _ServiceCardList({required this.services});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: services
          .map(
            (service) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: service.color,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(service.icon),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            service.description,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class BusinessItem {
  final String name;
  final String category;
  final double rating;
  final String distance;

  const BusinessItem({
    required this.name,
    required this.category,
    required this.rating,
    required this.distance,
  });
}

class _BusinessCardList extends StatelessWidget {
  final List<BusinessItem> businesses;

  const _BusinessCardList({required this.businesses});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: businesses
          .map(
            (b) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.grey[200],
                      ),
                      child: const Icon(Icons.storefront),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            b.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${b.category} • ${b.distance}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          b.rating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
