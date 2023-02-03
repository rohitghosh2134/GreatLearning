package com.example.rohitghosh.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.rohitghosh.model.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long>{

}