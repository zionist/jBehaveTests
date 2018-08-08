package com.tickeron.test.web.functional.steps;

import com.tickeron.test.common.exceptions.AssertionErrorWithContextParamsException;
import com.tickeron.test.web.functional.steps.service.ServiceStepsBasic;
import org.apache.commons.io.FileUtils;
import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;

import javax.imageio.ImageIO;
import javax.mail.*;
import javax.mail.internet.MimeMultipart;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Properties;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

/**
 * Created by slaviann on 17.12.15.
 * Mail client class
 */
//@PropertySource("classpath:app.properties")

public class ImageCompareSteps {

    @Autowired
    private Environment env;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private ServiceStepsBasic serviceStepsBasic;

    @Autowired
    private ApplicationContext applicationContext;

    private Optional<BufferedImage> getDifferenceImage(BufferedImage img1, BufferedImage img2) {
        // convert images to pixel arrays...
        Boolean hasDiff = false;
        final int w = img1.getWidth(),
                h = img1.getHeight(),
                highlight = Color.MAGENTA.getRGB();

        final int[] p1 = img1.getRGB(0, 0, w, h, null, 0, w);
        final int[] p2 = img2.getRGB(0, 0, w, h, null, 0, w);
        // compare img1 to img2, pixel by pixel. If different, highlight img1's pixel...
        for (int i = 0; i < p1.length; i++) {
            if (p1[i] != p2[i]) {
                hasDiff = true;
                p1[i] = highlight;
            }
        }
        // save img1's pixels to a new BufferedImage, and return it...
        // (May require TYPE_INT_ARGB)
        if (hasDiff) {
            final BufferedImage out = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
            out.setRGB(0, 0, w, h, p1, 0, w);
            return Optional.of(out);
        }
        return Optional.empty();
    }

    private void makeScreenshotInternal(String filename) {
        File scrFile = ((TakesScreenshot) seleniumSteps.getWebDriver()).getScreenshotAs(OutputType.FILE);
        try {
            File screenShotFile = getFileName(filename);
            FileUtils.copyFile(scrFile, screenShotFile);

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private File getFileName(String filename) {
        // replace to file separator in string
        if(filename.contains("\\") || filename.contains("/")) {
            filename = filename.replace("\\", File.separator);
            filename = filename.replace("/", File.separator);
        }
        return new File(Paths.get(env.getProperty("screenshot.path"),
                String.format("%s.png", filename)).toAbsolutePath().toString());
    }

    private void compareFiles(String newName, String oldName) throws IOException, InterruptedException {
        final String resultName = String.format("%s_result", oldName);
        long startTime = System.currentTimeMillis();
        Optional<BufferedImage> result = getDifferenceImage( ImageIO.read(getFileName(oldName)),
                ImageIO.read(getFileName(newName)));
        long estimatedTime = System.currentTimeMillis() - startTime;
        System.out.println(estimatedTime);
        if (result.isPresent()) {
            ImageIO.write(result.get(), "png", getFileName(resultName));
            fail(String.format("New screenshot file %s is not equal to old screenshot file %s", newName, oldName));
        }
    }

    private void compareScreenshotWithOldOne(String name) throws IOException, InterruptedException {
        if (env.getProperty("images.compare.screenshot", Boolean.class)) {
            String newName = String.format("%s_new", name);
            makeScreenshotInternal(newName);
            compareFiles(newName, name);

        }
    }

    /**
     * Make screenshot if images.make.screenshot = true
     * Save it to name.png
     *
     * Make screenshot if images.compare.screenshot = true
     * Save it to name_new.png
     * Compare screenshots. In difference case fail test and save result to new_result.png
     */
    @When("Make/Compare screenshot to/with file $name")
    public void compareOrMakeScreenshot(String name) throws InterruptedException, MessagingException, IOException {
        if (env.getProperty("images.make.screenshot", Boolean.class))
            makeScreenshotInternal(name);
        if (env.getProperty("images.compare.screenshot", Boolean.class))
            compareScreenshotWithOldOne(name);

    }





}
