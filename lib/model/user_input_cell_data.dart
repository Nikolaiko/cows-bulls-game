import 'package:cows_bulls_game/model/digit_button_type_enum.dart';

class UserInputCellData {
  final String value;
  final DigitButtonTypeEnum type;

  UserInputCellData(this.value, this.type);

  UserInputCellData copyWithValue(String newValue) {
    return UserInputCellData(newValue, type);
  }

  UserInputCellData copyWithType(DigitButtonTypeEnum newType) {
    return UserInputCellData(value, newType);
  }
}