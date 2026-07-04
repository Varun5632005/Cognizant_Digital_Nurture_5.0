package com.cognizant.springlearn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringlearnApplication {

    private static final Logger LOGGER =
            LoggerFactory.getLogger(SpringlearnApplication.class);

    public static void displayCountry() {

        try (ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("country.xml")) {

            Country country = context.getBean("country", Country.class);

            LOGGER.debug("Country : {}", country);
        }
    }

    public static void main(String[] args) {

        displayCountry();

    }
}