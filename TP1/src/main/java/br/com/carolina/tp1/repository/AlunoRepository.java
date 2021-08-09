package br.com.carolina.tp1.repository;

import br.com.carolina.tp1.domain.Aluno;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.HashMap;

@Repository
public class AlunoRepository {
    private HashMap<Integer, Aluno> alunos;
    private static int ids = 4;

    public AlunoRepository() {
        this.alunos = new HashMap<>();
        alunos.put(1, new Aluno(1, "Carolina", "carolasilva99@gmail.com"));
        alunos.put(2, new Aluno(2, "Juarez", "juarez@gmail.com"));
        alunos.put(3, new Aluno(3, "João", "joãozinho@gmail.com"));
    }

    public Collection<Aluno> listar() {
        return alunos.values();
    }

    public Aluno obter(int id) {
        return alunos.get(id);
    }
}
