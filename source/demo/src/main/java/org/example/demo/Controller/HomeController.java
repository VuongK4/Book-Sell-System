package org.example.demo.Controller;


import org.example.demo.Entities.Product;
import org.example.demo.Repositories.ProductsRepository;
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
        List<Product> productsForHe = productsRepo.findTop5ByOrderByIdAsc();

        model.addAttribute("productsForHe", productsForHe);

        if (!productsForHe.isEmpty()) {
            model.addAttribute("initiaHeroProducts", productsForHe.get(0));
        }else {
            model.addAttribute("initiaHeroProducts", null);
        }

        return "home";
    }
}
