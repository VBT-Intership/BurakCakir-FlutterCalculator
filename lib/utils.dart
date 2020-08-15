import 'package:math_expressions/math_expressions.dart';

const String CLEAN = "C";
const String DELETE = "del";
const String RESULT = "=";
const String SAVE = "save";

List<String> listSavedResults = ["0"];
List<String> listFirstRow = [CLEAN, DELETE, "/", "x"];
List<String> listSecondRow = ["7", "8", "9", "-"];
List<String> listThirdRow = ["4", "5", "6", "+"];
List<String> listFourthRow = ["1", "2", "3", RESULT];
List<String> listFifthRow = ["0", "00", ".", SAVE];

String handleResult(String operation) {
  if (operation.contains("x")) operation = operation.replaceAll("x", "*");

  try {
    Parser parser = new Parser();
    Expression exp = parser.parse(operation);

    ContextModel contextModel = ContextModel();
    return "${exp.evaluate(EvaluationType.REAL, contextModel) as double}";
  } catch (e) {
    return "Invalid input";
  }
}
