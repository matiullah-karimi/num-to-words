class NumberToWords {

  static final tensNames = [
    "",
    " ten",
    " twenty",
    " thirty",
    " forty",
    " fifty",
    " sixty",
    " seventy",
    " eighty",
    " ninety"
  ];

  static final numNames = [
    "",
    " one",
    " two",
    " three",
    " four",
    " five",
    " six",
    " seven",
    " eight",
    " nine",
    " ten",
    " eleven",
    " twelve",
    " thirteen",
    " fourteen",
    " fifteen",
    " sixteen",
    " seventeen",
    " eighteen",
    " nineteen"
  ];


  static String _convertLessThanOneThousand(int number) {
    String soFar;

    if (number % 100 < 20){
      soFar = numNames[number % 100];
      number = (number ~/ 100).toInt();
    }
    else {
      soFar = numNames[number % 10];
      number = (number ~/ 10).toInt();

      soFar = tensNames[number % 10] + soFar;
      number = (number ~/ 10).toInt();
    }
    if (number == 0){
      return soFar;
    } 

    return numNames[number] + " hundred" + soFar;
  }


  static String convert(int number) {
    // 0 to 999 999 999 999
    if (number == 0) {
       return "zero"; 
    }

    String snumber = number.toString().padLeft(12, "0");
    // XXXnnnnnnnnn
    int billions = int.parse(snumber.substring(0, 3));
    // nnnXXXnnnnnn
    int millions  = int.parse(snumber.substring(3, 6));
    // nnnnnnXXXnnn
    int hundredThousands = int.parse(snumber.substring(6, 9));
    // nnnnnnnnnXXX
    int thousands = int.parse(snumber.substring(9, 12));
    
    String tradBillions = _getBillions(billions);
    String result =  tradBillions;

    String tradMillions = _getMillions(millions);
    result =  result + tradMillions;

    String tradHundredThousands = _getThousands(hundredThousands);
    result =  result + tradHundredThousands;

    String tradThousand;
    tradThousand = _convertLessThanOneThousand(thousands);
    result =  result + tradThousand;

    // remove extra spaces!
    return result.replaceAll("^\\s+", "").replaceAll("\\b\\s{2,}\\b", " ");
  }

  static String _getBillions(int billions) {
    String tradBillions;
    switch (billions) {
    case 0:
      tradBillions = "";
      break;
    case 1 :
      tradBillions = _convertLessThanOneThousand(billions)
      + " billion ";
      break;
    default :
      tradBillions = _convertLessThanOneThousand(billions)
      + " billion ";
    }
    return tradBillions;
  }

  static String _getMillions(int millions) {
    String tradMillions;
     switch (millions) {
    case 0:
      tradMillions = "";
      break;
    case 1 :
      tradMillions = _convertLessThanOneThousand(millions)
         + " million ";
      break;
    default :
      tradMillions = _convertLessThanOneThousand(millions)
         + " million ";
    }
    return tradMillions;
  }

  static String _getThousands(int hundredThousands) {
    String tradHundredThousands;
    switch (hundredThousands) {
    case 0:
      tradHundredThousands = "";
      break;
    case 1 :
      tradHundredThousands = "one thousand ";
      break;
    default :
      tradHundredThousands = _convertLessThanOneThousand(hundredThousands)
         + " thousand ";
    }

    return tradHundredThousands;
  }

  static bool isNumeric(String nums) {
    if(nums == null) {
      return false;
    }
    return double.tryParse(nums) != null;
  }
}
