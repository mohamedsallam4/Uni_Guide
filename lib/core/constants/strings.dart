const homepage = '/';
const detailsScreen = "/detail_page";
 

class AppConstants {
  // Base URL للـ API
  static const String baseUrl = 'https://universities.hipolabs.com';

  // دالة بسيطة لبناء رابط البحث حسب اسم الدولة
  // مثال: AppConstants.searchByCountryUri("Egypt")
  static Uri searchByCountryUri(String country) {
    final encoded = Uri.encodeComponent(country.trim());
    return Uri.parse('$baseUrl/search?country=$encoded');
  }
}
