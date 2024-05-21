package io.github.phati.jenkinspipeline.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@NoArgsConstructor
public class TestController  {
    @GetMapping("/test")
    public ResponseEntity<String> getMessage(){
        return new ResponseEntity<>("Hello from test api",HttpStatus.OK);
    }


    @GetMapping("/test2")
    public ResponseEntity<Map<String,Object>> test(){
        Map<String,Object> data = new HashMap<>();
        data.put("app_name","Spring boot app");
        data.put("version","3.0.3");
        return new ResponseEntity<>(data,HttpStatus.OK);
    }

}
