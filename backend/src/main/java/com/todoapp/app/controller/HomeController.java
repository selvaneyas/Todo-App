package com.todoapp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    public static class ApiEndpoint {
        public String method;
        public String endpoint;
        public String description;
        public String status;

        public ApiEndpoint(String method, String endpoint, String description, String status) {
            this.method = method;
            this.endpoint = endpoint;
            this.description = description;
            this.status = status;
        }

        // Getters (if needed)
    }

    @GetMapping("/")
    public String showDashboard(Model model) {
        List<ApiEndpoint> apis = List.of(
            new ApiEndpoint("GET", "/tasks", "Get all tasks", "WORKING"),
            new ApiEndpoint("POST", "/tasks", "Create new task", "WORKING"),
            new ApiEndpoint("PUT", "/tasks/{id}", "Update task", "WORKING"),
            new ApiEndpoint("DELETE", "/tasks/{id}", "Delete task", "WORKING")
        );

        model.addAttribute("apis", apis);
        return "index";  // loads index.html from templates
    }
}
