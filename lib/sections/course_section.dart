import 'package:flutter/material.dart';

class CourseSection extends StatelessWidget {
  const CourseSection({super.key});

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
          _buildSectionTitle(context, isMobile),
          const SizedBox(height: 60),
          _buildCourseOverview(context, isMobile),
          const SizedBox(height: 60),
          _buildWhoShouldAttend(context, isMobile),
          const SizedBox(height: 60),
          _buildCourseModules(context, isMobile),
          const SizedBox(height: 60),
          _buildCourseDetails(context, isMobile),
          const SizedBox(height: 60),
          _buildCareerOutcomes(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, bool isMobile) {
    return Column(
      children: [
        Text(
          'Offshore Wind Energy Course',
          textAlign: TextAlign.center,
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

  Widget _buildCourseOverview(BuildContext context, bool isMobile) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.05),
            Theme.of(context).colorScheme.secondary.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.menu_book,
            size: 48,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 20),
          Text(
            'Course Overview',
            style: TextStyle(
              fontSize: isMobile ? 26 : 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'This course provides participants with the essential knowledge, practical skills, and industry awareness required to work safely and effectively within the offshore wind energy sector.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              height: 1.8,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Delivered by experienced industry professionals, the program blends classroom-based theory with hands-on practical training to prepare candidates for real-world offshore environments.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              height: 1.8,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhoShouldAttend(BuildContext context, bool isMobile) {
    final attendees = [
      'Individuals seeking entry into the offshore wind industry',
      'Technicians, engineers, and professionals transitioning from other energy sectors',
      'Existing offshore workers wishing to update or expand their skill set',
      'Graduates and apprentices pursuing a career in renewable energy',
    ];

    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Column(
        children: [
          Text(
            'Who Should Attend',
            style: TextStyle(
              fontSize: isMobile ? 26 : 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 30),
          ...attendees.map((attendee) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 24,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        attendee,
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildCourseModules(BuildContext context, bool isMobile) {
    final modules = [
      {
        'icon': Icons.wind_power,
        'title': 'Introduction to Offshore Wind Energy',
        'points': [
          'Global and UK market overview',
          'Key components of offshore wind farms',
          'Project lifecycle and operations',
        ],
      },
      {
        'icon': Icons.health_and_safety,
        'title': 'Health, Safety & Environment (HSE)',
        'points': [
          'Safety culture and risk assessment',
          'Offshore legislation and industry standards',
          'Environmental awareness',
        ],
      },
      {
        'icon': Icons.verified_user,
        'title': 'Basic Offshore Safety Training (GWO)',
        'points': [
          'Working at Heights',
          'Manual Handling',
          'Fire Awareness',
          'First Aid',
          'Sea Survival',
        ],
      },
      {
        'icon': Icons.settings,
        'title': 'Technical Skills Development',
        'points': [
          'Electrical and mechanical fundamentals',
          'Turbine structure and maintenance principles',
          'Fault detection and troubleshooting',
        ],
      },
      {
        'icon': Icons.anchor,
        'title': 'Offshore Operations & Logistics',
        'points': [
          'Vessel transfers and access systems',
          'Communication protocols',
          'Emergency procedures',
        ],
      },
      {
        'icon': Icons.trending_up,
        'title': 'Career Development & Industry Insight',
        'points': [
          'CV and interview preparation',
          'Industry networking and employment pathways',
          'Continuing professional development (CPD) opportunities',
        ],
      },
    ];

    return Column(
      children: [
        Text(
          'Course Modules',
          style: TextStyle(
            fontSize: isMobile ? 28 : 34,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: modules.map((module) => _buildModuleCard(context, module, isMobile)).toList(),
        ),
      ],
    );
  }

  Widget _buildModuleCard(BuildContext context, Map<String, dynamic> module, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 380,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  module['icon'] as IconData,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  module['title'] as String,
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...(module['points'] as List<String>).map((point) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        point,
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 15,
                          color: Colors.grey[700],
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildCourseDetails(BuildContext context, bool isMobile) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Column(
        children: [
          Text(
            'Course Information',
            style: TextStyle(
              fontSize: isMobile ? 28 : 34,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildInfoCard(
                context,
                Icons.schedule,
                'Duration',
                '2 to 4 weeks',
                'Depending on selected modules and certification requirements',
                isMobile,
              ),
              _buildInfoCard(
                context,
                Icons.location_on,
                'Location',
                'North East England',
                'Access to simulation environments and offshore equipment',
                isMobile,
              ),
              _buildInfoCard(
                context,
                Icons.workspace_premium,
                'Certification',
                'Industry-Recognised',
                'GWO Basic Safety Training and additional specialist modules',
                isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    IconData icon,
    String title,
    String value,
    String description,
    bool isMobile,
  ) {
    return Container(
      width: isMobile ? double.infinity : 300,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.secondary,
            size: 40,
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 20 : 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCareerOutcomes(BuildContext context, bool isMobile) {
    final careers = [
      'Offshore Wind Turbine Technician',
      'Maintenance Engineer',
      'HSE Officer',
      'Project Support Technician',
    ];

    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
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
            Icons.work,
            size: 48,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 20),
          Text(
            'Career Outcomes',
            style: TextStyle(
              fontSize: isMobile ? 26 : 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Graduates of this program are equipped to pursue roles such as:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: careers.map((career) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        career,
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                )).toList(),
          ),
        ],
      ),
    );
  }
}
