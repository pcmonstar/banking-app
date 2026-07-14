package com.bank;

/**
 * Hello world!
 *
 */
public class App {

    public static void main(String[] args) throws Exception {

        System.out.println("==================================");
        System.out.println("Banking Application");
        System.out.println("Version : Prashant - Practice");
	System.out.println("Build Number : Rahul Version 2");
        System.out.println("Environment : DEVELOPMENT - Git hub");
        System.out.println("Application Started Successfully. Build from Jenkins Pipeline and webhook");
        System.out.println("==================================");

        while (true) {
            Thread.sleep(10000);
            System.out.println("Application is running...");
        }
    }
}
