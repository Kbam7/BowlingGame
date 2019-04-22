import utest.Runner;
import utest.ui.Report;

class Main {
    static public function main() {
        var testRunner = new Runner();

        testRunner.addCase(new BowlingGameTest());

        Report.create(testRunner);
        testRunner.run();
    }
}