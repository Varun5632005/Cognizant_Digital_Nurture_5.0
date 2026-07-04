package com.cognizant.springrest.service;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cognizant.springrest.model.Country;

@Service
public class CountryService {

    @SuppressWarnings("unchecked")
    public Country getCountry(String code) {

        try (ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("country.xml")) {

            List<Country> countries =
                    (List<Country>) context.getBean("countryList");

            for (Country country : countries) {
                if (country.getCode().equalsIgnoreCase(code)) {
                    return country;
                }
            }

            return null;
        }
    }
}