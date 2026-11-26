import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kalimba_gamelan/oyun_kalimba_gamelan.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kalimbaGamelanConfig.title.length, 33);
    expect(kalimbaGamelanConfig.tagline.length, 33);
    for (final s in kalimbaGamelanConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kalimbaGamelanConfig.gameId, kalimbaGamelanId);
    expect(kalimbaGamelanRules.gameId, kalimbaGamelanId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kalimbaGamelanRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kalimbaGamelanId, optionalMechanics: kalimbaGamelanRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kalimbaGamelanRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
