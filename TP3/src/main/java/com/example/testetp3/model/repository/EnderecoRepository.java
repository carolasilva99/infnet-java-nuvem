package com.example.testetp3.model.repository;

import com.example.testetp3.model.domain.Endereco;
import com.example.testetp3.model.domain.Usuario;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EnderecoRepository extends CrudRepository<Endereco, Integer> {
}

