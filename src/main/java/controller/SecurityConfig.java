package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import model.Usuario;

import java.io.IOException;

@WebFilter("/*")
public class SecurityConfig implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();
        String resourcePath = uri.substring(contextPath.length());

        // Libera URLs públicas
        if (resourcePath.equals("/login") ||
                resourcePath.equals("/viwer/login.jsp") ||
                resourcePath.startsWith("/resources/")) {
            chain.doFilter(request, response);
            return;
        }

        // Bloqueia se não estiver logado
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/viwer/login.jsp");
            return;
        }

        // Verifica a role do usuário
        Usuario user = (Usuario) session.getAttribute("user");

        // Protege /add e /pedidos para apenas admin
        if ((resourcePath.equals("/add") || resourcePath.equals("/pedidos")) &&
                !"admin".equals(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/viwer/index.jsp");
            return;
        }


        chain.doFilter(request, response);
    }
}
