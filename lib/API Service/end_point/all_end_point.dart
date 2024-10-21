// api_endpoints.dart
class ApiEndpoints {
  static const String customerAddressEndPoint = 'wp-json/wc/v3/customers';
  static const String allProductListEndPoint = 'wp-json/wc/v3/products';
  static const String customerSignUp = 'wp-json/wc/v3/customers';
  static const String customerLongin = 'wp-json/jwt-auth/v1/token';
  static const String paymentMethod = 'wp-json/wc/v3/payment_gateways';
  static const String createOrder = 'wp-json/wc/v3/orders';
  static const String categoriesEndPoint = 'wp-json/wc/v3/products/categories';
  static const String singleProductVariation = 'wp-json/wc/v3/products';
  // Method to generate product variation URL dynamically
  static String getSingleProductVariation(int productId) {
    return '$singleProductVariation/$productId/variations';
  }
}