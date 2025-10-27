# Cloudflare Pages Deployment Guide

This guide explains how to deploy the Wind Energy Training Institute website to Cloudflare Pages.

## Option 1: Automatic Deployment (Recommended)

### Configure Cloudflare Pages

1. Go to your Cloudflare Pages dashboard
2. Create a new project or select your existing project
3. Connect your Git repository (GitHub/GitLab)
4. Configure build settings:

   **Framework preset**: None or Flutter

   **Build command**:
   ```bash
   ./cloudflare-build.sh
   ```

   **Build output directory**:
   ```
   build/web
   ```

   **Root directory**:
   ```
   /
   ```

   **Environment variables** (optional):
   - `FLUTTER_VERSION`: stable (or specify version like `3.16.0`)

5. Click "Save and Deploy"

### Build Process

The `cloudflare-build.sh` script will:
- Install Flutter SDK
- Enable Flutter web support
- Install project dependencies
- Build the production web app
- Output to `build/web` directory

## Option 2: Manual Build and Deploy

If you prefer to build locally and deploy:

### 1. Build Locally

```bash
# Install dependencies
flutter pub get

# Build for production
flutter build web --release --web-renderer canvaskit
```

### 2. Deploy to Cloudflare Pages

#### Using Wrangler CLI:

```bash
# Install Wrangler
npm install -g wrangler

# Login to Cloudflare
wrangler login

# Deploy
wrangler pages deploy build/web --project-name=weti
```

#### Using Direct Upload:

1. Go to Cloudflare Pages dashboard
2. Click "Create a project"
3. Select "Direct Upload"
4. Upload the contents of `build/web` folder
5. Give it a project name (e.g., `weti`)

## Build Output Structure

After building, the `build/web` directory will contain:

```
build/web/
├── index.html
├── main.dart.js
├── flutter.js
├── manifest.json
├── assets/
├── canvaskit/
└── icons/
```

## Custom Domain Setup

1. In Cloudflare Pages dashboard, go to your project
2. Click "Custom domains"
3. Add your custom domain (e.g., `www.weti.org.uk`)
4. Follow Cloudflare's DNS configuration instructions

## Environment-Specific Configuration

### Production URL
Your site will be available at:
- Cloudflare Pages URL: `https://your-project.pages.dev`
- Custom domain: `https://www.yourdomain.com`

### Preview Deployments
Every push to a branch creates a preview deployment at:
- `https://<branch-name>.<your-project>.pages.dev`

## Troubleshooting

### Build Fails
- Check Flutter version compatibility
- Ensure all dependencies are specified in `pubspec.yaml`
- Review build logs in Cloudflare Pages dashboard

### Assets Not Loading
- Verify `<base href>` in `web/index.html`
- Check asset paths are relative
- Ensure assets are declared in `pubspec.yaml`

### Performance Optimization
The build uses `canvaskit` renderer for best performance. You can switch to `html` renderer for smaller bundle size:

```bash
flutter build web --release --web-renderer html
```

## Build Time Optimization

To speed up builds, you can cache the Flutter SDK in Cloudflare Pages:

Add to your build script:
```bash
# Cache Flutter SDK
if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
fi
```

## Continuous Deployment

With automatic deployment:
- Push to `main` branch → Deploys to production
- Push to other branches → Creates preview deployment
- Pull requests → Automatic preview links

## Support

For issues with Cloudflare Pages deployment:
- [Cloudflare Pages Documentation](https://developers.cloudflare.com/pages/)
- [Flutter Web Documentation](https://docs.flutter.dev/platform-integration/web)

---

**Note**: First deployment may take 5-10 minutes as Flutter SDK is downloaded and installed. Subsequent builds will be faster if caching is configured.
