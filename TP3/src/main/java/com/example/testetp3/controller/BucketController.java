package com.example.testetp3.controller;

import com.example.testetp3.model.service.AmazonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/storage/")
public class BucketController {
    private AmazonClient amazonClient;

    @Autowired
    BucketController(AmazonClient amazonClient) {
        this.amazonClient = amazonClient;
    }

    @PostMapping
    public String uploadFile(@RequestPart(value = "file")MultipartFile file) {
        return this.amazonClient.uploadFile(file);
    }

    @DeleteMapping
    public String deleteFile(@RequestPart(value = "url") String fileUrl) {
        return this.amazonClient.deleteFile(fileUrl);
    }

}
