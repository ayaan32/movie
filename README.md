# Movies Database Application

A Flutter application that displays trending and now playing movies using the TMDB API. Users can search for movies, view details, and bookmark their favorites. The app works offline by caching data in a local database.

## Features

- 🏠 **Home Screen**: Displays trending movies and now playing movies
- 🔍 **Search**: Search for movies with debounced search (updates as you type)
- 📱 **Movie Details**: View detailed information about each movie
- ⭐ **Bookmarks**: Save your favorite movies for quick access
- 📴 **Offline Support**: Works offline by caching data in local database
- 🎨 **Modern UI**: Clean and intuitive user interface

## Architecture

The app follows **BLoC (Business Logic Component) architecture** with:

- **Data Layer**: Models, API service (Retrofit), Local Database (Drift), Repository
- **Presentation Layer**: BLoC (Events, States, Bloc), UI Screens, Widgets
- **Dependency Injection**: GetIt for managing dependencies

## Setup Instructions

### 1. Get TMDB API Key

1. Go to [TMDB](https://www.themoviedb.org/)
2. Create an account and get your API key from [API Settings](https://www.themoviedb.org/settings/api)
3. Replace `YOUR_API_KEY_HERE` in `lib/data/repository/movie_repository.dart` with your actual API key

```dart
static const String _apiKey = 'YOUR_ACTUAL_API_KEY';
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Generate Code

**IMPORTANT**: Run the build runner to generate the necessary code files. This is required before the app can run.

**If using FVM:**
```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

**Or use the provided build script:**
```bash
./build.sh
```

**If using standard Flutter:**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate:
- JSON serialization code for models (`.g.dart` files)
- Retrofit API service implementation
- Drift database code

**Note**: If you encounter any errors about missing generated files, make sure to run this command first. The linter errors you see are expected until the code generation is complete.

### 4. Run the App

```bash
flutter run
```

## Project Structure

```
lib/
├── core/
│   └── di/
│       └── injection_container.dart
├── data/
│   ├── api/
│   │   └── movie_api_service.dart
│   ├── database/
│   │   └── app_database.dart
│   ├── models/
│   │   ├── movie_model.dart
│   │   └── movie_details_model.dart
│   └── repository/
│       └── movie_repository.dart
└── presentation/
    ├── bloc/
    │   ├── bookmarks/
    │   ├── home/
    │   ├── movie_details/
    │   └── search/
    ├── screens/
    │   ├── bookmarks_screen.dart
    │   ├── home_screen.dart
    │   ├── movie_details_screen.dart
    │   └── search_screen.dart
    └── widgets/
        ├── movie_card.dart
        └── movie_list_item.dart
```

## Dependencies

- **flutter_bloc**: State management using BLoC pattern
- **retrofit**: Type-safe HTTP client
- **dio**: HTTP client for making API calls
- **drift**: Local database for offline storage
- **get_it**: Dependency injection
- **connectivity_plus**: Check network connectivity
- **cached_network_image**: Image caching
- **equatable**: Value equality for BLoC states and events

## API Endpoints Used

- Trending Movies: `/trending/movie/day`
- Now Playing: `/movie/now_playing`
- Search: `/search/movie`
- Movie Details: `/movie/{id}`

## Offline Functionality

The app caches movie data in a local SQLite database using Drift. When offline:
- Previously loaded movies are displayed from cache
- Search requires internet connection
- Bookmarked movies are always available

## Platform Support

- ✅ Android
- ✅ iOS

## Important Notes

1. **API Key**: You MUST replace `YOUR_API_KEY_HERE` in `lib/data/repository/movie_repository.dart` with your actual TMDB API key before running the app.

2. **Code Generation**: The app uses code generation for:
   - JSON serialization (models)
   - Retrofit API client
   - Drift database
   
   You MUST run `flutter pub run build_runner build --delete-conflicting-outputs` before the app will compile.

3. **Permissions**: Internet permission is already added to AndroidManifest.xml for Android. For iOS, no additional setup is needed.

4. **Generated Files**: Files ending in `.g.dart` are auto-generated and should not be edited manually.

## Troubleshooting

- **"Target of URI hasn't been generated" errors**: Run `flutter pub run build_runner build --delete-conflicting-outputs`
- **API errors**: Make sure you've added your TMDB API key
- **Database errors**: Ensure you've run build_runner to generate Drift database code
