class Char {
  int? _intValue;

  Char(String charValue) {
    if (charValue.length != 1) {
      throw Exception(
          'Can not create new Char from "$charValue". The given String has to have the length 1');
    }
    _intValue = charValue.codeUnitAt(0);
  }

  @override
  String toString() {
    return String.fromCharCode(_intValue!);
  }

  @override
  bool operator ==(other) => toString() == other.toString();

  @override
  int get hashCode => _intValue.hashCode;
}

class Tuple<FirstType, SecondType> {
  FirstType? _firstValue;
  SecondType? _secondValue;

  Tuple(FirstType first, SecondType second) {
    _firstValue = first;
    _secondValue = second;
  }

  FirstType get first {
    return _firstValue!;
  }

  SecondType get second {
    return _secondValue!;
  }
}

class SaveMap<KeyType, ValueType> {
  List<Tuple<KeyType, ValueType>>? _tupleList;
  SaveMap(List<Tuple<KeyType, ValueType>> tupleList) {
    _tupleList = tupleList;
  }

  ValueType get(KeyType key) {
    for (var tuple in _tupleList!) {
      if (tuple.first == key) {
        return tuple.second;
      }
    }
    throw Exception('No value found for key "$key"');
  }

  bool has(KeyType key) {
    for (var tuple in _tupleList!) {
      if (tuple.first == key) {
        return true;
      }
    }
    return false;
  }
}
