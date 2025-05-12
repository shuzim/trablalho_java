package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import model.Usuario;

import java.io.IOException;

@WebFilter("*.jsp")
public class SecurityConfig implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        String path = req.getRequestURI();

        if (path.contains("login.jsp") || path.contains("login")) {
            chain.doFilter(request, response);
            return;
        }

        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        Usuario user = (Usuario) session.getAttribute("user");
        if (path.contains("admin.jsp") && !"admin".equals(user.getRole())) {
            resp.sendRedirect("error.jsp");
            return;
        }

        chain.doFilter(request, response);
    }
}
