package com.demo;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class LoginTest {
    public static void main(String[] args) throws InterruptedException {

        WebDriverManager.chromedriver().setup();

        WebDriver driver = new ChromeDriver();

        // Open Gmail
        driver.get("https://www.gmail.com");
        System.out.println("Opened: " + driver.getTitle());

        // Type email into the email field
        driver.findElement(By.id("identifierId")).sendKeys("test@gmail.com");
        System.out.println("Email entered.");

        // Click the Next button
        driver.findElement(By.id("identifierNext")).click();
        System.out.println("Clicked Next.");

        // Wait 3 seconds so you can visually see it happened
        Thread.sleep(3000);

        System.out.println("Login step executed successfully.");

        driver.quit();
    }
}