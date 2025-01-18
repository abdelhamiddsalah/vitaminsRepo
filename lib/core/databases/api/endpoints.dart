class Endpoints {
  static const baseUrl = 'https://vitaminss.vercel.app/api/';
  static const loginendpoint = '${baseUrl}auth/login';
  static const registerendpoint = '${baseUrl}auth/register';
  static const forgetpasswordendpoint = 'auth/forgot-password';
  static const resetpasswordendpoint = 'auth/reset-password/:token';
}