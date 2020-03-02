package examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import test.BaseTest;

import static org.junit.jupiter.api.Assertions.assertEquals;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class KarateRunnerTest extends BaseTest {

    // this will run all *.feature files that exist in sub-directories in single thread as Karate test
    // no Cucumber report will be available
    /*
    @Karate.Test
    Karate testAll() { return Karate.run().relativeTo(getClass()); }
    */

    @Test
    public void testParallel(){
        Results results = Runner.parallel(getClass(), threadCount);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
