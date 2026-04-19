package com.demo;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;
import java.util.List;

public class CountListItems {
    public static void main(String[] args) {

        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();

        // This is a dedicated Selenium practice page with a reliable dropdown
        driver.get("https://the-internet.herokuapp.com/dropdown");
        System.out.println("Page Title: " + driver.getTitle());
        System.out.println("──────────────────────────────");

        // Locate the dropdown element
        WebElement dropdownElement = driver.findElement(By.id("dropdown"));

        // Wrap it with Select class to access dropdown-specific methods
        Select dropdown = new Select(dropdownElement);

        // Get all options as a list
        List<WebElement> options = dropdown.getOptions();

        // Count them
        System.out.println("Total items in dropdown: " + options.size());
        System.out.println("──────────────────────────────");

        // Print each option's text
        System.out.println("Items:");
        for (WebElement option : options) {
            System.out.println("  - " + option.getText());
        }

        System.out.println("──────────────────────────────");
        driver.quit();
        System.out.println("Done.");
    }
}