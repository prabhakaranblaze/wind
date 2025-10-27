import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final Function(String) onNavigate;

  const CustomNavigationBar({super.key, required this.onNavigate});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    // Note: In a real implementation, you'd listen to scroll events
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: _isScrolled
            ? Colors.white.withOpacity(0.95)
            : Colors.white.withOpacity(0.0),
        boxShadow: _isScrolled
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]
            : [],
      ),
      child: isMobile ? _buildMobileNav(context) : _buildDesktopNav(context),
    );
  }

  Widget _buildDesktopNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        Row(
          children: [
            _buildNavItem('Home', 'home'),
            const SizedBox(width: 30),
            _buildNavItem('About', 'about'),
            const SizedBox(width: 30),
            _buildNavItem('Industry', 'industry'),
            const SizedBox(width: 30),
            _buildNavItem('Course', 'course'),
            const SizedBox(width: 30),
            _buildContactButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _showMobileMenu(context);
          },
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return GestureDetector(
      onTap: () => widget.onNavigate('home'),
      child: Row(
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
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, String section) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onNavigate(section),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildContactButton() {
    return ElevatedButton(
      onPressed: () => widget.onNavigate('contact'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text('Contact Us'),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                widget.onNavigate('home');
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                widget.onNavigate('about');
              },
            ),
            ListTile(
              title: const Text('Industry'),
              onTap: () {
                Navigator.pop(context);
                widget.onNavigate('industry');
              },
            ),
            ListTile(
              title: const Text('Course'),
              onTap: () {
                Navigator.pop(context);
                widget.onNavigate('course');
              },
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                widget.onNavigate('contact');
              },
            ),
          ],
        ),
      ),
    );
  }
}
