package org.example.bss.repositories;

import org.example.bss.entites.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductsRepository extends JpaRepository<Product, Integer> {
    List<Product> findTop5ByOrderByIdAsc();
}
