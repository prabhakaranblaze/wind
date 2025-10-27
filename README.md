# Wind Energy Training Institute Website

A modern, responsive Flutter web application for the Wind Energy Training Institute (WETI), showcasing offshore wind energy training programs.

## Overview

This is a static content website built with Flutter Web that provides information about the Wind Energy Training Institute's courses, mission, and the growing offshore wind energy industry.

## Features

- **Single Page Application**: Smooth scrolling between sections
- **Responsive Design**: Optimized for desktop, tablet, and mobile devices
- **Modern UI**: Clean, professional design with blue/green color scheme
- **Sections**:
  - Hero/Landing section with institute branding
  - About Us section with mission and values
  - Industry Overview showcasing global opportunities
  - Detailed Course Information with modules
  - Contact Form for enquiries
  - Footer with quick links and contact info

## Project Structure

```
lib/
├── main.dart                 # Application entry point
├── sections/                 # Page sections
│   ├── hero_section.dart
│   ├── about_section.dart
│   ├── industry_section.dart
│   ├── course_section.dart
│   ├── contact_section.dart
│   └── footer_section.dart
└── widgets/                  # Reusable widgets
    └── navigation_bar.dart

web/
├── index.html               # Web entry point
└── manifest.json            # Web app manifest
```

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- A web browser (Chrome, Firefox, Safari, or Edge)

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd wind
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run -d chrome
   ```

4. Build for production:
   ```bash
   flutter build web --release
   ```

## Deployment

### Cloudflare Pages (Recommended)

This project is configured for automatic deployment to Cloudflare Pages.

**Quick Setup:**
- **Build command**: `./cloudflare-build.sh`
- **Build output directory**: `build/web`
- **Root directory**: `/`

📘 **[View Complete Cloudflare Deployment Guide](CLOUDFLARE_DEPLOYMENT.md)**

The deployment guide includes:
- Automatic deployment setup
- Manual deployment options
- Custom domain configuration
- Build optimization tips

### Local Testing

Before deploying, test locally:

```bash
# Build the app
flutter build web --release --base-href /

# Serve locally (using Python)
cd build/web
python3 -m http.server 8000

# Visit http://localhost:8000
```

🔧 **Having issues?** Check the **[Troubleshooting Guide](TROUBLESHOOTING.md)** for solutions to common problems like empty pages.

## Course Information

The website features the **Offshore Wind Energy Course** which includes:

### Modules
- Introduction to Offshore Wind Energy
- Health, Safety & Environment (HSE)
- Basic Offshore Safety Training (GWO)
- Technical Skills Development
- Offshore Operations & Logistics
- Career Development & Industry Insight

### Duration
2 to 4 weeks (depending on modules selected)

### Location
North East England with simulation environments and offshore equipment

### Certifications
Industry-recognized certifications including GWO Basic Safety Training

## Color Scheme

- **Primary Color**: Deep Blue (#0D47A1) - Representing trust and professionalism
- **Secondary Color**: Green (#4CAF50) - Representing renewable energy and growth

## Technologies Used

- **Flutter**: UI framework
- **Google Fonts**: Typography
- **url_launcher**: Contact links

## Future Enhancements

- Multi-page navigation (when scaling up)
- Backend integration for contact form
- Course booking system
- Student portal
- Blog/News section
- Gallery of training facilities

## Contact Form

The enquiry form collects:
- Full Name
- Email Address
- Phone Number
- Course Interest
- Message

*Note: Currently displays a success message. Backend integration required for actual form submission.*

## Contributing

This is a proprietary project for Wind Energy Training Institute.

## License

© 2025 Wind Energy Training Institute. All rights reserved.

## Support

For questions or support, contact:
- Email: info@weti.org.uk
- Phone: +44 (0) XXX XXX XXXX
