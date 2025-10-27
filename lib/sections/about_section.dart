import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          _buildSectionTitle(context, 'About Us', isMobile),
          const SizedBox(height: 60),
          isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: _buildImagePlaceholder(context),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 1,
          child: _buildContent(context, false),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildImagePlaceholder(context),
        const SizedBox(height: 40),
        _buildContent(context, true),
      ],
    );
  }

  Widget _buildImagePlaceholder(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
        image: const DecorationImage(
          image: NetworkImage(
            'https://via.placeholder.com/600x400/0D47A1/FFFFFF?text=Training+Facility',
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Leading Institute in Offshore Wind Training',
          style: TextStyle(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'The Wind Energy Training Institute is a leading institute, joint venture of one of world leading OEM of offshore wind turbine headquartered in Denmark and India, excellence dedicated to developing the skilled workforce driving the global transition to clean energy.',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            height: 1.8,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Based in the North East of England — a hub of offshore innovation — we deliver industry-leading training programs designed by professionals with decades of hands-on experience in offshore wind.',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            height: 1.8,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 30),
        _buildMissionBox(context, isMobile),
        const SizedBox(height: 30),
        _buildKeyPoints(context, isMobile),
      ],
    );
  }

  Widget _buildMissionBox(BuildContext context, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.stars,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 10),
              Text(
                'Our Mission',
                style: TextStyle(
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            'To empower individuals with the technical knowledge, safety awareness, and practical expertise required to succeed in one of the world\'s fastest-growing industries.',
            style: TextStyle(
              fontSize: isMobile ? 15 : 16,
              height: 1.6,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyPoints(BuildContext context, bool isMobile) {
    final points = [
      {
        'icon': Icons.school,
        'text': 'Expert instruction from industry professionals',
      },
      {
        'icon': Icons.psychology,
        'text': 'Real-world insight and practical training',
      },
      {
        'icon': Icons.verified,
        'text': 'Industry-recognized certifications',
      },
      {
        'icon': Icons.trending_up,
        'text': 'Career pathways in renewable energy',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What Sets Us Apart',
          style: TextStyle(
            fontSize: isMobile ? 20 : 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 20),
        ...points.map((point) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    point['icon'] as IconData,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 24,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      point['text'] as String,
                      style: TextStyle(
                        fontSize: isMobile ? 15 : 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, bool isMobile) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 32 : 42,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
