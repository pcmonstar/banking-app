package com.bank;

/**
 * Hello world!
 *
 */
public class App {

    public static void main(String[] args) throws Exception {

        System.out.println("==================================");
        System.out.println("Banking Application");
        System.out.println("Version : v3");
	System.out.println("Build Number : 2");
        System.out.println("Environment : DEV");
        System.out.println("Application Started Successfully. Build from Jenkins Pipeline");
        System.out.println("==================================");

        while (true) {
            Thread.sleep(10000);
            System.out.println("Application is running...");
        }
    }
}
