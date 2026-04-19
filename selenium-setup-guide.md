Step 1 — Verify Java is Installed

```bash
java --version
javac --version
```

if not installed:

- download JDK from adoptium.net and install it.
- Simple Windows installer (.msi) that sets up JAVA_HOME automatically

---

Step 2 — Install Eclipse IDE

- Go to eclipse.org/downloads and download the Eclipse Installer.
- Run the installer and when it asks which package to install
- pick: "Eclipse IDE for Java Developers

---

Step 3 — Create your project in Eclipse

- Select workspace (or go with default)
- File → New → Maven Project
- Check "Create a simple project (skip archetype selection)" → Next
- Fill in:
  - Group Id: com.demo
  - Artifact Id: SeleniumDemo
- Finish

---

Step 4- Update pom.xml

Open pom.xml (double-click it in Eclipse) and replace everything in it with following and Save the file with Ctrl+S

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">

  <modelVersion>4.0.0</modelVersion>
  <groupId>com.demo</groupId>
  <artifactId>SeleniumDemo</artifactId>
  <version>0.0.1-SNAPSHOT</version>

  <!-- Fix Java version -->
  <properties>
    <maven.compiler.source>21</maven.compiler.source>
    <maven.compiler.target>21</maven.compiler.target>
  </properties>

  <dependencies>

    <!-- Selenium -->
    <dependency>
      <groupId>org.seleniumhq.selenium</groupId>
      <artifactId>selenium-java</artifactId>
      <version>4.20.0</version>
    </dependency>

    <!-- WebDriverManager: auto-downloads correct ChromeDriver -->
    <dependency>
      <groupId>io.github.bonigarcia</groupId>
      <artifactId>webdrivermanager</artifactId>
      <version>5.8.0</version>
    </dependency>

  </dependencies>

</project>
```

---

Step 5 - Update the Project

- Right-click SeleniumDemo in the left panel → Maven → Update Project
- A dialog will open. Make sure:
  - Force Update of Snapshots/Releases is checked
  - Your project SeleniumDemo is selected
- Click OK.

---

Step 6 - Create a package inside src/main/java

- Right-click src/main/java (the top one)
- New → Package
- Name it com.demo
- Click Finish

---

Step 7 - 

- Now src/main/java will expand and show com.demo inside it.
- Then right-click com.demo → New → Class → name it TestDemo → Finish.