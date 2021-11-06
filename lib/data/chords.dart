import 'dart:math';

class Chords {


  static List<String> chordTypes = [
    'M',
    'm',
    'dim',
    '+',
    'sus2',
    'sus4',
  ];

  static List<String> roots = [
    'C',
    'D',
    'E',
    'F',
    'G',
    'A',
    'B',
  ];

  static String getRandomChord({
    required bool flat,
    required bool seventh,
  }) { //♭ ♯
    bool isFlat = flat?Random().nextBool():false;
    bool isSeventh = seventh?Random().nextBool():false;
    String _root = roots[Random().nextInt(roots.length)];
    String _chord = chordTypes[Random().nextInt(isSeventh?4:chordTypes.length)];
    return '$_root${isFlat?Random().nextBool()?'♭':'♯':''}$_chord${isSeventh?'7':''}';
  }
}