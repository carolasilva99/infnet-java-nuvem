package com.example.testetp3.controller;

import com.amazonaws.util.IOUtils;
import com.example.testetp3.model.domain.Usuario;
import com.example.testetp3.model.service.AmazonClient;
import com.example.testetp3.model.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UsuarioController {
    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private AmazonClient amazonClient;

    @GetMapping(value = "/usuario")
    public String telaCadastro() {
        return "cadastro";
    }

    @GetMapping(value = "/consulta")
    public String telaConsulta() {
        return "consulta";
    }

    @GetMapping(value = "/usuario/consulta")
    public String buscar(Model model, String email) {
        try {
            Usuario usuario = usuarioService.buscar(email);
            model.addAttribute("usuario", usuario);
            model.addAttribute("imagem",  this.amazonClient.getFile(usuario.getImagemUrl()));
        }
        catch (Exception ex) {
            model.addAttribute("mensagem", ex.getMessage());
        }
        return "consulta";
    }

    @PostMapping(value = "/usuario")
    public String incluir(Model model,  Usuario usuario, @RequestPart(value = "imagem") MultipartFile file) {
        try {
            usuarioService.incluir(usuario, file);
            return "redirect:/";
        }
        catch(Exception ex) {
            model.addAttribute("mensagem", ex.getMessage());
            return "cadastro";
        }
    }

    @PostMapping(value = "/usuario/alterar")
    public String alterar(Model model,  Usuario usuario, @RequestPart(value = "imagem") MultipartFile file) {
        try {
            Usuario alterar = usuarioService.buscar(usuario.getEmail());
            if (usuario.getImagemUrl() != null) {
                alterar.setImagemUrl(usuario.getImagemUrl());
            }
            alterar.setNome(usuario.getNome());
            alterar.setEndereco(usuario.getEndereco());
            alterar.setEmail(usuario.getEmail());
            usuarioService.alterar(alterar, file);
            return "consulta";
        }
        catch(Exception ex) {
            model.addAttribute("mensagem", ex.getMessage());
            return "consulta";
        }
    }
}
