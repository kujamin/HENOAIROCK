package com.heno.airock.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PythonController {
    @GetMapping("/message")
    public ResponseEntity<String> getMessage() {
    	
    	String msg = "i am so sad";
    	
        return ResponseEntity.ok(msg);
        
    }
    
}
