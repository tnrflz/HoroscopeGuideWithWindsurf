import 'package:flutter/foundation.dart';
import '../models/horoscope_model.dart';

class HoroscopeProvider with ChangeNotifier {
  final List<Horoscope> _horoscopes = [
    Horoscope(
      name: 'Aries',
      symbol: '♈',
      dateRange: 'March 21 - April 19',
      description: 'Bold and ambitious, Aries are natural leaders with fiery energy.',
      element: 'Fire',
      compatibility: ['Leo', 'Sagittarius'],
    ),
    Horoscope(
      name: 'Taurus',
      symbol: '♉',
      dateRange: 'April 20 - May 20',
      description: 'Reliable and patient, Taurus values stability and comfort.',
      element: 'Earth',
      compatibility: ['Virgo', 'Capricorn'],
    ),
    Horoscope(
      name: 'Gemini',
      symbol: '♊',
      dateRange: 'May 21 - June 20',
      description: 'Curious and adaptable, Gemini is known for their dual nature.',
      element: 'Air',
      compatibility: ['Libra', 'Aquarius'],
    ),
    Horoscope(
      name: 'Cancer',
      symbol: '♋',
      dateRange: 'June 21 - July 22',
      description: 'Emotional and nurturing, Cancer values family and home.',
      element: 'Water',
      compatibility: ['Scorpio', 'Pisces'],
    ),
    Horoscope(
      name: 'Leo',
      symbol: '♌',
      dateRange: 'July 23 - August 22',
      description: 'Confident and charismatic, Leo loves to be in the spotlight.',
      element: 'Fire',
      compatibility: ['Aries', 'Sagittarius'],
    ),
    Horoscope(
      name: 'Virgo',
      symbol: '♍',
      dateRange: 'August 23 - September 22',
      description: 'Analytical and practical, Virgo is a perfectionist at heart.',
      element: 'Earth',
      compatibility: ['Taurus', 'Capricorn'],
    ),
    Horoscope(
      name: 'Libra',
      symbol: '♎',
      dateRange: 'September 23 - October 22',
      description: 'Diplomatic and charming, Libra seeks balance and harmony.',
      element: 'Air',
      compatibility: ['Gemini', 'Aquarius'],
    ),
    Horoscope(
      name: 'Scorpio',
      symbol: '♏',
      dateRange: 'October 23 - November 21',
      description: 'Passionate and resourceful, Scorpio is known for their intensity.',
      element: 'Water',
      compatibility: ['Cancer', 'Pisces'],
    ),
    Horoscope(
      name: 'Sagittarius',
      symbol: '♐',
      dateRange: 'November 22 - December 21',
      description: 'Adventurous and optimistic, Sagittarius loves to explore.',
      element: 'Fire',
      compatibility: ['Aries', 'Leo'],
    ),
    Horoscope(
      name: 'Capricorn',
      symbol: '♑',
      dateRange: 'December 22 - January 19',
      description: 'Disciplined and ambitious, Capricorn values hard work and success.',
      element: 'Earth',
      compatibility: ['Taurus', 'Virgo'],
    ),
    Horoscope(
      name: 'Aquarius',
      symbol: '♒',
      dateRange: 'January 20 - February 18',
      description: 'Innovative and independent, Aquarius is a true visionary.',
      element: 'Air',
      compatibility: ['Gemini', 'Libra'],
    ),
    Horoscope(
      name: 'Pisces',
      symbol: '♓',
      dateRange: 'February 19 - March 20',
      description: 'Compassionate and artistic, Pisces is deeply intuitive.',
      element: 'Water',
      compatibility: ['Cancer', 'Scorpio'],
    ),
  ];

  List<Horoscope> get horoscopes => _horoscopes;

  Horoscope getHoroscopeByName(String name) {
    return _horoscopes.firstWhere(
      (horoscope) => horoscope.name.toLowerCase() == name.toLowerCase(),
      orElse: () => throw Exception('Horoscope not found'),
    );
  }

  // Future method to simulate fetching daily horoscope
  Future<String> getDailyHoroscope(String sign) async {
    // In a real app, this would call an external API
    await Future.delayed(const Duration(seconds: 1));
    return 'Today is a day of opportunities for $sign. Trust your instincts and be open to new experiences.';
  }
}
