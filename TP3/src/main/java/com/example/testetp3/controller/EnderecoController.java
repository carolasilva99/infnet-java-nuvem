package com.example.testetp3.controller;

import com.example.testetp3.model.domain.Endereco;
import com.example.testetp3.model.service.ViaCepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/endereco/")
public class EnderecoController {
    @Autowired
    private ViaCepService viaCepService;

    @GetMapping("{cep}")
    public Endereco buscarEnderecoPorCep(@PathVariable(name = "cep") String cep) {
        return viaCepService.buscaEnderecoPorCep(cep);
    }
}
