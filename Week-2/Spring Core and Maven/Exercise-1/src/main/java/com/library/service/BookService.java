package com.library.service;

import com.library.repository.BookRepository;

public class BookService {

    private BookRepository repository;

    public BookService() {
        System.out.println("BookService Bean Created");
    }

    public void setRepository(BookRepository repository) {
        this.repository = repository;
    }

    public void serviceMethod() {

        System.out.println("Book Service Working");

        repository.displayRepository();
    }

}