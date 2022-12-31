package com.example.myapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.myapp.model.Coffee;

public interface CoffeeRepository extends JpaRepository<Coffee, Long> {

  
}
