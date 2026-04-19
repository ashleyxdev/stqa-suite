package com.demo;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class CountObjects {
    public static void main(String[] args) {

        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();

        driver.get("https://www.wikipedia.org");
        System.out.println("Page Title: " + driver.getTitle());
        System.out.println("──────────────────────────────");

        // Count EVERY element on the page
        int totalObjects = driver.findElements(By.tagName("*")).size();
        System.out.println("Total Objects on Page: " + totalObjects);
        System.out.println("──────────────────────────────");

        // Count individual objects
        String[] tags = {"a", "img", "button", "input", "form", "table"};

        for (String tag : tags) {
            int count = driver.findElements(By.tagName(tag)).size();
            System.out.println("  <" + tag + "> count: " + count);
        }

        System.out.println("──────────────────────────────");
        driver.quit();
        System.out.println("Done.");
    }
}