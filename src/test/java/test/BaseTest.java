package test;

import lombok.extern.slf4j.Slf4j;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;

@Slf4j
public abstract class BaseTest {

    protected int threadCount;

    @BeforeAll
    public void setUp(){
        threadCount = (System.getProperty("thread.count") == null) ? 1 : Integer.parseInt(System.getProperty("thread.count"));
        log.info("Thread count: " + threadCount);
    }

    @AfterAll
    public static void generateReport() {
        int lastIndex = System.getProperty("user.dir").lastIndexOf('\\') + 1;
        Collection<File> jsonFiles = FileUtils.listFiles(new File("target/surefire-reports"), new String[] {"json"}, true);
        ArrayList jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), System.getProperty("user.dir").substring(lastIndex));
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
