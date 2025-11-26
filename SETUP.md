# Setup Instructions

## Quick Start

1. **Add your TMDB API Key**
   - Open `lib/data/repository/movie_repository.dart`
   - Replace `YOUR_API_KEY_HERE` on line 11 with your actual TMDB API key
   - Get your API key from: https://www.themoviedb.org/settings/api

2. **Install Dependencies**
   ```bash
   fvm flutter pub get
   ```

3. **Generate Code Files (REQUIRED)**
   ```bash
   fvm flutter pub run build_runner build --delete-conflicting-outputs
   ```
   
   Or use the build script:
   ```bash
   ./build.sh
   ```

4. **Run the App**
   ```bash
   fvm flutter run
   ```

## Troubleshooting

### "Target of URI hasn't been generated" errors
- **Solution**: Run `fvm flutter pub run build_runner build --delete-conflicting-outputs`
- These errors are expected until code generation is complete

### "The name 'MoviesData' isn't a type" errors
- **Solution**: These will be resolved after running build_runner
- Drift generates these types automatically from your table definitions

### "Cannot execute" with FVM
- Make sure FVM is properly installed: `fvm install`
- Check FVM is in your PATH
- Try running: `fvm use <version>` to set the Flutter version

### API Errors
- Verify your TMDB API key is correct
- Check your internet connection
- Ensure the API key has proper permissions

## What Gets Generated?

The build_runner command generates:
- `*.g.dart` files for JSON serialization (models)
- `movie_api_service.g.dart` for Retrofit API client
- `app_database.g.dart` for Drift database code

These files are auto-generated and should not be edited manually.

