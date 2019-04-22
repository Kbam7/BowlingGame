class Game {
    private var _rolls:Array<Int> = [];
    private var _currentRoll:Int = 0;

    public function new() {}

    public function roll(pins:Int) {
        _rolls[_currentRoll++] = pins;
    }

    public function score():Int {
        var score:Int = 0;
        var rollIndex:Int = 0;

        for (frame in 0...10) {
            if (isStrike(rollIndex)) { // strike
                score += 10 + strikeBonus(rollIndex);
                rollIndex++;
            } else if (isSpare(rollIndex)) {
                score += 10 + spareBonus(rollIndex);
                rollIndex += 2;
            } else {
                score += sumOfBallsInFrame(rollIndex);
                rollIndex += 2;
            }
        }
        return score;
    }

    private function sumOfBallsInFrame(rollIndex:Int):Int {
        return _rolls[rollIndex] + _rolls[rollIndex + 1];
    }

    private function spareBonus(rollIndex:Int):Int {
        return _rolls[rollIndex + 2];
    }

    private function strikeBonus(rollIndex:Int):Int {
        return _rolls[rollIndex + 1] + _rolls[rollIndex + 2];
    }

    private function isStrike(rollIndex:Int):Bool {
        return _rolls[rollIndex] == 10;
    }

    private function isSpare(rollIndex:Int):Bool {
        return _rolls[rollIndex] + _rolls[rollIndex +  1] == 10;
    }
}