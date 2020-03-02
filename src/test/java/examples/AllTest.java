package examples;

import com.intuit.karate.junit5.Karate;

class AllTest {
    
    // this will run all *.feature files that exist in sub-directories
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
    
}
