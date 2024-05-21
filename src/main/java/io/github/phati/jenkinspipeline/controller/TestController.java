package io.github.phati.jenkinspipeline.controller;

import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@NoArgsConstructor
public class TestController  {
    @GetMapping("/test")
    public ResponseEntity<String> getMessage(){
        return new ResponseEntity<>("Hello from test api",HttpStatus.OK);
    }

}
