class ValidateFunc{
  String validatorEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return "Invalid Email";
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length > 0 && value.length < 8) {
      return "Password is to small";
    }
    if (value.isEmpty) {
      return "Password can't be empty";
    }
    return null;
  }
}