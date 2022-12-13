package runner;

import com.intuit.karate.junit5.Karate;

public class testRunner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("src/test/java/features");
    }

}
