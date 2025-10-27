# Troubleshooting Guide

## Empty Page After Build

If you're seeing an empty/blank page after building and deploying, follow these steps:

### 1. Check Browser Console

Open your browser's Developer Tools (F12) and check the Console tab for errors:

**Common errors and fixes:**

- **`serviceWorkerVersion is not defined`**
  - **Cause**: Service worker variable not initialized before use
  - **Fix**: This is now fixed in `web/index.html` - the variable is defined with a fallback value
  - **Note**: If you still see this, ensure you're using the latest version of `web/index.html`

- **404 errors for `main.dart.js` or `flutter.js`**
  - **Cause**: Incorrect base href
  - **Fix**: Ensure `base href="/"` in `web/index.html`
  - **Fix**: Build with `--base-href /` flag

- **CORS errors**
  - **Cause**: Assets blocked by CORS policy
  - **Fix**: Check Cloudflare Pages settings for proper headers

- **Module loading errors**
  - **Cause**: Incompatible web renderer
  - **Fix**: Try switching between `html` and `canvaskit` renderers

### 2. Verify Build Output

After building, check that `build/web/` contains:

```bash
build/web/
├── index.html
├── main.dart.js         # Main application code
├── flutter.js           # Flutter loader
├── flutter_service_worker.js
├── manifest.json
├── assets/
│   ├── AssetManifest.json
│   ├── FontManifest.json
│   └── fonts/
└── canvaskit/ (if using canvaskit renderer)
```

**To verify:**
```bash
ls -la build/web/
```

### 3. Test Locally

Before deploying, test the build locally:

#### Option 1: Using Python
```bash
cd build/web
python3 -m http.server 8000
# Visit http://localhost:8000
```

#### Option 2: Using Node.js
```bash
npm install -g serve
serve build/web -p 8000
# Visit http://localhost:8000
```

#### Option 3: Using Flutter (during development)
```bash
flutter run -d chrome --release
```

### 4. Check Cloudflare Pages Settings

In your Cloudflare Pages dashboard:

1. **Build Configuration**
   - Build command: `./cloudflare-build.sh`
   - Build output directory: `build/web`
   - Root directory: `/`

2. **Environment Variables**
   - No special variables needed for basic setup

3. **Build Logs**
   - Check for errors in the deployment logs
   - Look for "Build complete!" message

### 5. Common Fixes

#### Fix 1: Update index.html base href
```html
<!-- Change from this -->
<base href="$FLUTTER_BASE_HREF">

<!-- To this -->
<base href="/">
```

#### Fix 2: Try Different Web Renderer
```bash
# HTML renderer (smaller, faster)
flutter build web --release --web-renderer html --base-href /

# CanvasKit renderer (better graphics)
flutter build web --release --web-renderer canvaskit --base-href /

# Auto (Flutter decides)
flutter build web --release --web-renderer auto --base-href /
```

#### Fix 3: Clear Build Cache
```bash
flutter clean
flutter pub get
flutter build web --release --web-renderer html --base-href /
```

#### Fix 4: Check for Missing Dependencies
```bash
flutter doctor -v
flutter pub get
```

### 6. Debugging Loading Issues

Add this to your `web/index.html` to see loading progress:

```html
<div id="loading">
  <div class="loader"></div>
  <div id="loading-text">Loading...</div>
</div>

<script>
  window.addEventListener('error', function(e) {
    console.error('Error:', e);
    document.getElementById('loading-text').textContent =
      'Error: ' + e.message;
  });
</script>
```

### 7. Network Tab Inspection

In Browser DevTools → Network tab:

- Check that `main.dart.js` loads successfully (status 200)
- Verify `flutter.js` loads correctly
- Look for any failed requests (red)
- Check file sizes (main.dart.js should be several MB)

### 8. Hard Refresh

Sometimes browser cache causes issues:

- **Windows/Linux**: `Ctrl + Shift + R` or `Ctrl + F5`
- **Mac**: `Cmd + Shift + R`
- **Chrome**: DevTools → Right-click refresh → Empty Cache and Hard Reload

### 9. Cloudflare-Specific Issues

#### Cache Purging
If you deployed a fix but still see the old version:
1. Go to Cloudflare dashboard
2. Navigate to Caching
3. Click "Purge Everything"

#### Custom Domain Issues
If using a custom domain:
- Ensure DNS is properly configured
- Check SSL/TLS settings (should be "Full" or "Full (strict)")
- Verify domain is active in Cloudflare Pages settings

### 10. Check Service Worker

If you've deployed before, service workers might cache old versions:

1. Open DevTools → Application tab
2. Click "Service Workers"
3. Click "Unregister" for any service workers
4. Refresh the page

### Quick Diagnostic Checklist

- [ ] Browser console shows no errors
- [ ] `main.dart.js` loads (check Network tab)
- [ ] `base href="/"` in index.html
- [ ] Build completed without errors
- [ ] Build output directory is `build/web`
- [ ] All files exist in `build/web/`
- [ ] Tested locally before deployment
- [ ] Hard refresh performed (Ctrl+Shift+R)
- [ ] Service worker cleared (if applicable)

### Still Having Issues?

If the page is still empty:

1. Check the exact error message in browser console
2. Verify the build logs in Cloudflare Pages
3. Test the build locally using a simple HTTP server
4. Try building with different renderers (html vs canvaskit)
5. Ensure Flutter SDK version is compatible (>=3.0.0)

### Contact Support

If problems persist:
- Include browser console errors
- Share Cloudflare Pages build logs
- Specify Flutter version: `flutter --version`
- Test in different browsers (Chrome, Firefox, Safari)
