class Endpoints {
  static const baseUrl = 'https://vitaminss.vercel.app/api/';
  static const loginendpoint = '${baseUrl}auth/login';
  static const registerendpoint = '${baseUrl}auth/register';
  static const forgetpasswordendpoint = '${baseUrl}auth/forgot-password';
  static const fetchisdealproductsendpoint = '${baseUrl}products';
  static const fetchcategoriesendpoint = '${baseUrl}categories';
  
  
  // دالة لإنشاء رابط reset password مع الـ token
  static String resetPasswordEndpoint(String token) {
    return '${baseUrl}auth/reset-password/$token';
  }
}
