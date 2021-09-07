package com.example.testetp3.model.service;

import com.example.testetp3.model.domain.Endereco;
import com.example.testetp3.model.domain.Usuario;
import com.example.testetp3.model.exception.CepInvalidoException;
import com.example.testetp3.model.exception.EmailDuplicadoException;
import com.example.testetp3.model.repository.UsuarioRepository;
import feign.FeignException;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UsuarioService {
    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private EnderecoService enderecoService;

    @Autowired
    private ViaCepService viaCepService;

    @Autowired
    private AmazonClient amazonClient;

    public void incluir(Usuario usuario, MultipartFile file) {
        try {
            usuario.setEndereco(mapeiaEndereco(usuario));
            String base64 = amazonClient.uploadFile(file);
            if (base64 != null) {
                usuario.setImagemUrl(base64);
            }
            enderecoService.incluir(usuario.getEndereco());
            usuarioRepository.save(usuario);
        }
        catch (ConstraintViolationException | DataIntegrityViolationException exception) {
            throw new EmailDuplicadoException("O e-mail já existe em nossa base!");
        }
        catch (FeignException ex) {
            throw new CepInvalidoException("Houve um erro ao consultar o cep: " + ex.getMessage());
        }
    }

    private Endereco mapeiaEndereco(Usuario usuario) {
        Endereco enderecoUsuario = usuario.getEndereco();
        int id = enderecoUsuario.getId();
        String numero = enderecoUsuario.getNumero();
        String complemento = enderecoUsuario.getComplemento();
        enderecoUsuario = viaCepService.buscaEnderecoPorCep(enderecoUsuario.getCep());
        enderecoUsuario.setId(id);
        enderecoUsuario.setNumero(numero);
        enderecoUsuario.setComplemento(complemento);
        return enderecoUsuario;
    }

    public Usuario buscar(String email) {
        return usuarioRepository.findByEmail(email);
    }

    public void alterar(Usuario alterar, MultipartFile file) {
        this.incluir(alterar, file);
    }
}
