import com.intuit.karate.junit5.Karate;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

class TestRunner {

    @Test
    void testUsers() {
        Karate.run("classpath:features/users.feature").relativeTo(getClass());
    }

    public static void generateReport(String karateOutputPath) {
        File reportOutputDir = new File("target/cucumber-reports");
        List<String> jsonFiles = new ArrayList<>();
        jsonFiles.add(karateOutputPath);

        Configuration config = new Configuration(reportOutputDir, "Karate API Automation");
        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, config);
        reportBuilder.generateReports();
    }
} 