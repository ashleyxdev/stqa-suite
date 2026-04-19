package com.demo;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import java.util.List;

public class CountCheckboxes {
    public static void main(String[] args) {

        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();

        driver.get("https://the-internet.herokuapp.com/checkboxes");
        System.out.println("Page Title: " + driver.getTitle());
        System.out.println("──────────────────────────────");

        // Find all checkboxes on the page
        List<WebElement> checkboxes = driver.findElements(By.cssSelector("input[type='checkbox']"));

        int totalCount   = checkboxes.size();
        int checkedCount = 0;
        int uncheckedCount = 0;

        // Loop through each checkbox and check its state
        for (WebElement checkbox : checkboxes) {
            if (checkbox.isSelected()) {
                checkedCount++;
            } else {
                uncheckedCount++;
            }
        }

        System.out.println("Total Checkboxes : " + totalCount);
        System.out.println("Checked          : " + checkedCount);
        System.out.println("Unchecked        : " + uncheckedCount);
        System.out.println("──────────────────────────────");

        driver.quit();
        System.out.println("Done.");
    }
}