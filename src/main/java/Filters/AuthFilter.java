package Filters;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AuthFilter implements Filter {
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession(false);
        boolean logado = (session != null && session.getAttribute("usuario") != null);

        String loginURI = request.getContextPath() + "/login.jsp";

        if (logado || request.getRequestURI().equals(loginURI) || request.getRequestURI().contains("LoginServlet")) {
            chain.doFilter(req, res);
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    public void init(FilterConfig filterConfig) {
    }

    public void destroy() {
    }
}