import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection_container.dart';
import 'presentation/bloc/home/home_bloc.dart';
import 'presentation/bloc/search/search_bloc.dart';
import 'presentation/bloc/bookmarks/bookmarks_bloc.dart';
import 'presentation/bloc/bookmarks/bookmarks_event.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/search_screen.dart';
import 'presentation/screens/bookmarks_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final BookmarksBloc _bookmarksBloc = getIt<BookmarksBloc>();

  late final List<Widget> _screens = [
    BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: const SearchScreen(),
    ),
    BlocProvider.value(
      value: _bookmarksBloc,
      child: const BookmarksScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Refresh bookmarks when switching to bookmarks tab
          if (index == 2) {
            _bookmarksBloc.add(const LoadBookmarks());
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
        ],
      ),
    );
  }
}
