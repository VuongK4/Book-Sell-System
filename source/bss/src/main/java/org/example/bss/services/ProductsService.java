package org.example.bss.services;

import org.example.bss.entites.Product;
import org.example.bss.repositories.ProductsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductsService {

    private final ProductsRepository productsRepo;

    @Autowired
    public ProductsService(ProductsRepository productsRepo) {
        this.productsRepo = productsRepo;
    }

    // Phương thức để lấy 5 sản phẩm đầu tiên
    public List<Product> getTop5Products() {
        return productsRepo.findTop5ByOrderByIdAsc();
    }
}
