import 'package:flutter/material.dart';

class IndustrySection extends StatelessWidget {
  const IndustrySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          _buildSectionTitle(context, isMobile),
          const SizedBox(height: 60),
          _buildIntroduction(context, isMobile),
          const SizedBox(height: 60),
          _buildStatsCards(context, isMobile),
          const SizedBox(height: 60),
          _buildGlobalGrowth(context, isMobile),
          const SizedBox(height: 60),
          _buildWorkforceOpportunities(context, isMobile),
          const SizedBox(height: 60),
          _buildTrainingRole(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, bool isMobile) {
    return Column(
      children: [
        Text(
          'Global Offshore Wind Energy',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 32 : 42,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Demand & Opportunities',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 28 : 38,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
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

  Widget _buildIntroduction(BuildContext context, bool isMobile) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Text(
        'Offshore wind energy is one of the fastest-growing renewable energy sectors in the world, playing a vital role in the global transition to clean, sustainable power. Nations across Europe, Asia, and the Americas are investing heavily in offshore wind to meet net-zero carbon targets, strengthen energy security, and create green jobs for future generations.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: isMobile ? 16 : 20,
          height: 1.8,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildStatsCards(BuildContext context, bool isMobile) {
    final stats = [
      {'number': '500+', 'label': 'Gigawatts', 'sublabel': 'by 2035'},
      {'number': '5x', 'label': 'Growth', 'sublabel': 'in capacity'},
      {'number': '1000s', 'label': 'Jobs', 'sublabel': 'created annually'},
    ];

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: stats.map((stat) => _buildStatCard(context, stat, isMobile)).toList(),
    );
  }

  Widget _buildStatCard(BuildContext context, Map<String, String> stat, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 280,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            stat['number']!,
            style: TextStyle(
              fontSize: isMobile ? 40 : 48,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            stat['label']!,
            style: TextStyle(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            stat['sublabel']!,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlobalGrowth(BuildContext context, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.public,
                color: Theme.of(context).primaryColor,
                size: 32,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  'Global Growth and Market Expansion',
                  style: TextStyle(
                    fontSize: isMobile ? 22 : 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          _buildBulletPoint(
            context,
            'The global offshore wind capacity is projected to increase fivefold by 2035, reaching over 500 gigawatts of installed power.',
            isMobile,
          ),
          const SizedBox(height: 15),
          _buildBulletPoint(
            context,
            'Massive offshore developments are underway in the UK, Europe, the United States, China, Japan, South Korea, and Taiwan, making this a truly international industry.',
            isMobile,
          ),
          const SizedBox(height: 15),
          _buildBulletPoint(
            context,
            'Governments and private investors are committing billions in infrastructure and workforce development, driving strong demand for qualified, safety-trained professionals.',
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildWorkforceOpportunities(BuildContext context, bool isMobile) {
    final opportunities = [
      {
        'icon': Icons.build,
        'title': 'Wind Turbine Installation & Maintenance',
        'description': 'Technical roles in turbine installation, commissioning, and ongoing maintenance',
      },
      {
        'icon': Icons.directions_boat,
        'title': 'Marine Operations & Logistics',
        'description': 'Vessel operations, offshore logistics, and supply chain management',
      },
      {
        'icon': Icons.security,
        'title': 'Health, Safety & Environmental',
        'description': 'Safety specialists ensuring compliance and risk management',
      },
      {
        'icon': Icons.engineering,
        'title': 'Electrical & Mechanical Engineering',
        'description': 'Engineering roles in design, implementation, and optimization',
      },
      {
        'icon': Icons.business_center,
        'title': 'Project Management & Support',
        'description': 'Planning, coordination, and administrative support services',
      },
    ];

    return Column(
      children: [
        Text(
          'Workforce Opportunities',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 28 : 34,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'This global expansion has created unprecedented demand for skilled workers',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: opportunities.map((opp) => _buildOpportunityCard(context, opp, isMobile)).toList(),
        ),
      ],
    );
  }

  Widget _buildOpportunityCard(BuildContext context, Map<String, dynamic> opportunity, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 350,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              opportunity['icon'] as IconData,
              color: Theme.of(context).colorScheme.secondary,
              size: 32,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            opportunity['title'] as String,
            style: TextStyle(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            opportunity['description'] as String,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrainingRole(BuildContext context, bool isMobile) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            Theme.of(context).primaryColor.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            Icons.school,
            size: 48,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 20),
          Text(
            'The Role of Training Institutes',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 26 : 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'At the Offshore Wind Energy Training Institute, we prepare the workforce needed to power this global revolution.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: Colors.grey[700],
              height: 1.6,
            ),
          ),
          const SizedBox(height: 30),
          _buildTrainingPoint(
            context,
            Icons.verified,
            'Equip learners with the technical skills and safety certifications required by international employers',
            isMobile,
          ),
          const SizedBox(height: 20),
          _buildTrainingPoint(
            context,
            Icons.handyman,
            'Provide hands-on, practical experience in realistic offshore training environments',
            isMobile,
          ),
          const SizedBox(height: 20),
          _buildTrainingPoint(
            context,
            Icons.trending_up,
            'Open career pathways to opportunities in the UK and worldwide',
            isMobile,
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'By investing in quality training today, we are building the talent that will drive the clean energy systems of tomorrow.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
                height: 1.6,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrainingPoint(BuildContext context, IconData icon, String text, bool isMobile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: isMobile ? 15 : 17,
              color: Colors.grey[700],
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text, bool isMobile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Icon(
            Icons.check_circle,
            color: Theme.of(context).colorScheme.secondary,
            size: 24,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: isMobile ? 15 : 17,
              color: Colors.grey[700],
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
