class WordSymbolSwitchUseCase {
  String symbolToWord(String word) {
    String newWord = word.toLowerCase();
    newWord = newWord.replaceAll(' ', '');
    newWord = newWord.replaceAll('-', '');
    newWord = newWord.replaceAll('.', '');
    newWord = newWord.replaceAll('+', 'plus');
    newWord = newWord.replaceAll('#', 'sharp');
    newWord = newWord.replaceAll('*', 'star');

    return newWord;
  }

  String wordToSymbol(String word) {
    String newWord = word.toLowerCase();
    newWord = newWord.replaceAll('plus', '+');
    newWord = newWord.replaceAll('sharp', '#');
    newWord = newWord.replaceAll('star', '*');

    return newWord;
  }
}
