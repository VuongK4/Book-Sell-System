package org.example.bss.controllers;

import org.example.bss.entities.Product;
import org.example.bss.repositories.ProductsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private ProductsRepository productsRepo;

//HOME
    @GetMapping("/view")
    public String showHome(Model model) {
        List<Product> productsForHeroCarousel = productsRepo.findTop5ByOrderByIdAsc();

        if (!productsForHeroCarousel.isEmpty()) {
            model.addAttribute("initiaHeroProducts", productsForHeroCarousel.get(0));
        }else {
            model.addAttribute("initiaHeroProducts", null);
        }

        List<Product>  products = productsRepo.findAll();

        List<Product> featuredProducts = productsRepo.findByIsFeaturedTrue();

        model.addAttribute("productsForHeroCarousel", productsForHeroCarousel);
        model.addAttribute("products", products);
        model.addAttribute("featuredProducts", featuredProducts);

        return "home";
    }
}
