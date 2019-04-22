import Game;
import utest.Assert;

class BowlingGameTest extends utest.Test {
  private var _g:Game;

  public function setup() {
    _g = new Game();
  }

  private function rollMany(n:Int, pins:Int) {
    for (i in 0...n) _g.roll(pins);
  }

  private function rollSpare() {
    _g.roll(5);
    _g.roll(5);
  }

  private function rollStrike() {
    _g.roll(10);
  }

  public function testGutterGame() {
    rollMany(20, 0);
    Assert.equals(0, _g.score());
  }

  public function testAllOnes() {
    rollMany(20, 1);
    Assert.equals(20, _g.score());
  }

  public function testOneSpare() {
    rollSpare();
    _g.roll(3);
    rollMany(17, 0);
    Assert.equals(16, _g.score());
  }

  public function testOneStrike() {
    rollStrike();
    _g.roll(3);
    _g.roll(4);
    rollMany(17, 0);
    Assert.equals(24, _g.score());
  }

  public function testPerfectGame() {
    rollMany(12, 10);
    Assert.equals(300, _g.score());
  }
}