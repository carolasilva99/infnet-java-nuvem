package com.example.testetp3.model.service;

import com.example.testetp3.model.domain.Endereco;
import com.example.testetp3.model.domain.Usuario;
import com.example.testetp3.model.repository.EnderecoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EnderecoService {
    @Autowired
    private EnderecoRepository enderecoRepository;

    public void incluir(Endereco endereco) {
        enderecoRepository.save(endereco);
    }
}
