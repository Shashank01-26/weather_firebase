import 'package:flutter/material.dart';
import 'package:weather_assignment/screens/favorites_page.dart';
import 'package:weather_assignment/screens/search_screen.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int _currentIndex = 0;
  String _weatherCondition = 'Sunny';
  String _cityName = 'New York City';
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.deepPurple, Colors.black87],
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.only(top:10.0),
                    child: Text(
                      '15 Feb, 2024',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _cityName,
                    style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        gradient: const LinearGradient(
                          begin : Alignment.topLeft,
                            end: Alignment.bottomLeft,
                            colors: [Colors.indigo, Colors.blueGrey,Colors.teal]
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.45),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(start:50.0),
                                      child: Icon(Icons.wb_sunny, size: 100, color: Colors.yellow),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _isFavorite = !_isFavorite;
                                },
                                icon: Icon(
                                  _isFavorite == true ? Icons.favorite : Icons.favorite_border_outlined,
                                  color: _isFavorite == true ? Colors.red : null,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            '25°C',
                            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _weatherCondition,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white),
                          ),
                          const SizedBox(height: 80),
                          Container(
                            height: MediaQuery.sizeOf(context).height * 0.20,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.purple.withOpacity(0.12), Colors.black.withOpacity(0.32),Colors.indigo.withOpacity(0.2)],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildWeatherDetail('Wind', '10 km/h', Icons.wind_power),
                                const VerticalDivider(color: Colors.white),
                                _buildWeatherDetail('Humidity', '70%', Icons.water_drop),
                                const VerticalDivider(color: Colors.white),
                                _buildWeatherDetail('Precipitation', '20%', Icons.grain),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue, Colors.deepPurple],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: BottomNavigationBar(
                      currentIndex: _currentIndex,
                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                          _onTabTapped(index);
                        });
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
                          icon: Icon(Icons.favorite),
                          label: 'Favorites',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherDetail(String title, String value, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              decorationStyle: TextDecorationStyle.dashed,
              fontFamily: 'TimesNewRoman',
          ),
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  void _onTabTapped(int index) {
    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavoritesPage()),
        );
        break;
    }
  }
}