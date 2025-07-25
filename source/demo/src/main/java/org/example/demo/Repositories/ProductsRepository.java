package org.example.demo.Repositories;


import org.example.demo.Entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductsRepository extends JpaRepository<Product, Integer> {
    List<Product> findTop5ByOrderByIdAsc();
}
