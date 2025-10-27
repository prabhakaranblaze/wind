import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 80,
              vertical: isMobile ? 40 : 60,
            ),
            child: isMobile ? _buildMobileFooter(context) : _buildDesktopFooter(context),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
            ),
            child: Text(
              '© ${DateTime.now().year} Wind Energy Training Institute. All rights reserved.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 13 : 14,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildAboutColumn(context, false),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 1,
          child: _buildQuickLinksColumn(context, false),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 1,
          child: _buildContactColumn(context, false),
        ),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAboutColumn(context, true),
        const SizedBox(height: 30),
        _buildQuickLinksColumn(context, true),
        const SizedBox(height: 30),
        _buildContactColumn(context, true),
      ],
    );
  }

  Widget _buildAboutColumn(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.wind_power,
              color: Theme.of(context).colorScheme.secondary,
              size: 32,
            ),
            const SizedBox(width: 10),
            Text(
              'WETI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Wind Energy Training Institute',
          style: TextStyle(
            fontSize: isMobile ? 18 : 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Empowering the next generation of offshore wind professionals through industry-leading training programs.',
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            color: Colors.white.withOpacity(0.8),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        _buildSocialLinks(context),
      ],
    );
  }

  Widget _buildQuickLinksColumn(BuildContext context, bool isMobile) {
    final links = [
      {'title': 'Home', 'action': () {}},
      {'title': 'About Us', 'action': () {}},
      {'title': 'Industry Insights', 'action': () {}},
      {'title': 'Courses', 'action': () {}},
      {'title': 'Contact', 'action': () {}},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: TextStyle(
            fontSize: isMobile ? 18 : 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: link['action'] as VoidCallback,
                  child: Text(
                    link['title'] as String,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      color: Colors.white.withOpacity(0.8),
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildContactColumn(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Info',
          style: TextStyle(
            fontSize: isMobile ? 18 : 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        _buildContactItem(
          Icons.location_on_outlined,
          'North East England',
          isMobile,
        ),
        const SizedBox(height: 15),
        _buildContactItem(
          Icons.email_outlined,
          'info@weti.org.uk',
          isMobile,
        ),
        const SizedBox(height: 15),
        _buildContactItem(
          Icons.phone_outlined,
          '+44 (0) XXX XXX XXXX',
          isMobile,
        ),
        const SizedBox(height: 15),
        _buildContactItem(
          Icons.access_time,
          'Mon - Fri: 9:00 AM - 5:00 PM',
          isMobile,
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text, bool isMobile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: Colors.white.withOpacity(0.8),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLinks(BuildContext context) {
    final socials = [
      {'icon': Icons.facebook, 'action': () {}},
      {'icon': Icons.flutter_dash, 'action': () {}}, // Twitter placeholder
      {'icon': Icons.business, 'action': () {}}, // LinkedIn placeholder
    ];

    return Row(
      children: socials.map((social) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: social['action'] as VoidCallback,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    social['icon'] as IconData,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          )).toList(),
    );
  }
}
