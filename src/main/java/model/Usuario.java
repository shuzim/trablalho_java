package model;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
    public class Usuario {
        private String usuario;
        private String senha;
        private String roles;

        public String getUsername() { return usuario; }
        public void setUsername(String username) { this.usuario = username; }

        public String getPassword() { return senha; }
        public void setPassword(String password) { this.senha = password; }

        public String getRole() { return roles; }
        public void setRole(String role) { this.roles = role; }
    }


