extension StringExtension on String {
  ///Get whether or not this string is a Chinese character.
  ///Length of the string must be 1.
  bool isKanji() {
    if (this.length == 1) {
      if (this.codeUnitAt(0) > 12543) return true;
      return false;
    } else {
      throw Exception("The length of String must be exactly 1.");
    }
  }

  ///Get all the kanjis in the string.
  List<String> getKanjis() {
    var kanjis = <String>[];
    for (int i = 0; i < this.length; i++) {
      if (this.codeUnitAt(i) > 12543 && kanjis.contains(this[i]) == false) {
        kanjis.add(this[i]);
      }
    }
    return kanjis;
  }

  String toKatakana() {
    var str = '';

    for (var i in Iterable.generate(this.length)) {
      var code = this.codeUnitAt(i);
      str += String.fromCharCode(code + 96);
    }

    return str;
  }

  String toHiragana() {
    var str = '';

    for (var i in Iterable.generate(this.length)) {
      var code = this.codeUnitAt(i);
      str += String.fromCharCode(code - 96);
    }

    return str;
  }
}
