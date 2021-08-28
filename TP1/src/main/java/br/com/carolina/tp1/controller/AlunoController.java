package br.com.carolina.tp1.controller;

import br.com.carolina.tp1.domain.Aluno;
import br.com.carolina.tp1.repository.AlunoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collection;

@RestController
@RequestMapping("/alunos")
public class AlunoController {
    @Autowired
    private AlunoRepository repository;

    @GetMapping
    public Collection<Aluno> listarAlunos() {
        return repository.listar();
    }

    @GetMapping(path = {"/{id}"})
    public Aluno obterAluno(@PathVariable int id) {
        return repository.obter(id);
    }
}
