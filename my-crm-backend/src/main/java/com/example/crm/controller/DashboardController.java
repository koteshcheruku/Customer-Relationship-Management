package com.example.crm.controller;

import lombok.RequiredArgsConstructor;
import com.example.crm.service.dashboardService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class DashboardController {
    private final dashboardService service;
    @GetMapping("/api/dashboard")
    public ResponseEntity<?> dashboardView(Authentication authentication){
        return service.getData(authentication);
    }
}
