

abstract class ValidationHelper {
  static String? validateName(String value, String columnName, int maxLength) {
    Pattern pattern = r'^.{0,' + maxLength.toString() + '}';
    RegExp regex = new RegExp(pattern as String);
    if (value.length == 0) {
      return 'Vui lòng nhập $columnName.';
    } else if (!regex.hasMatch(value))
      return 'Số ký tự cho phép là $maxLength kí tự. Vui lòng nhập lại';
    else
      return null;
  }

  static String? validatePhoneNumber(String value) {
    Pattern pattern = r'^(0)+([0-9]{9})\b';
    RegExp regex = new RegExp(pattern as String) ;
    if (value.length == 0) {
      return "Vui lòng nhập số điện thoại.";
    } else if (!regex.hasMatch(value))
      return 'Vui lòng nhập số điện thoại theo định dạng 0xxxxxxxxx';
    else
      return null;
  }

  static String? validateBirthday(String value) {
    if (value.length == 0) {
      return "Vui lòng nhập ngày sinh.";
    }
    else
      return null;
  }

  static String? validateEmail(String value, bool isRequire) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(pattern as String);
    if (isRequire) {
      if (value.length == 0) {
        return "Vui lòng nhập email";
      } else if ( !regex.hasMatch(value)) {
        return 'Vui lòng điền một địa chỉ email hợp lệ.';
      }
    } else if (value.isNotEmpty && !regex.hasMatch(value)) {
      return 'Vui lòng điền một địa chỉ email hợp lệ.';
    } else
      return null;
  }

  static String? validateEmpty(String value, String suffix) {
    if (value.isEmpty) {
      return 'Vui lòng nhập ' + suffix;
    }
    return null;
  }

  static String? validatePassword(String value) {
    Pattern pattern1 = r'^.{8,}';
    Pattern pattern2 =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regex1 = new RegExp(pattern1 as String);
    RegExp regex2 = new RegExp(pattern2 as String );
    if (value.length == 0) {
      return "Vui lòng nhập mật khẩu.";
    } else if (!regex1.hasMatch(value)) {
      return 'Độ dài mật khẩu tối thiểu phải lớn hơn hoặc bằng 8';
    } else if (!regex2.hasMatch(value))
      return 'Mật khẩu phải bao gồm chữ, kí tự đặc biệt, số, chữ hoa, chữ thường';
    else
      return null;
  }


  static String? validateConfirmPassword(String value, String password) {
    if (value.length == 0) {
      return "Vui lòng nhập xác nhận mật khẩu.";
    } else if (value != password)
      return 'Xác nhận mật khẩu không chính xác. Vui lòng nhập lại.';
    else
      return null;
  }
}
