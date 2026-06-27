package com.example;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CalculatorTest {

    Calculator calculator;

    @Before
    public void setUp() {
        System.out.println("Before Test");
        calculator = new Calculator();
    }

    @After
    public void tearDown() {
        System.out.println("After Test");
    }

    @Test
    public void testAddition() {

        // Arrange
        int num1 = 10;
        int num2 = 20;

        // Act
        int result = calculator.add(num1, num2);

        // Assert
        assertEquals(30, result);
    }

    @Test
    public void testSubtraction() {

        // Arrange
        int num1 = 20;
        int num2 = 5;

        // Act
        int result = calculator.subtract(num1, num2);

        // Assert
        assertEquals(15, result);
    }
}