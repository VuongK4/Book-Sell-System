package org.example.bss.controllers;

import org.example.bss.entites.Product;
import org.example.bss.repositories.ProductsRepository;
import org.example.bss.services.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("API")
public class ProductsController {

    private final ProductsRepository productsRepo;
    private final ProductsService productsService;

    @Autowired
    public ProductsController(ProductsRepository productsRepo, ProductsService productsService) {
        this.productsRepo = productsRepo;
        this.productsService = productsService;
    }

//HOME
    @GetMapping("/home")
    public String showHome(Model model) {
        List<Product> top5Products = productsService.getTop5Products();

        model.addAttribute("Top5Products", top5Products);
        model.addAttribute("BestSelling", top5Products);

        if(!top5Products.isEmpty()){
            model.addAttribute("initiaHeroProducts", top5Products.get(0));
        }else {
            model.addAttribute("initiaHeroProducts", null);
        }
        return "home";
    }
}
