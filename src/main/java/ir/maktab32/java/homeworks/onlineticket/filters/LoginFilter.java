package ir.maktab32.java.homeworks.onlineticket.filters;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username.contains(" ") || username.contains("*") || username == null || password == null
                || username.isEmpty() || password.isEmpty()){
            ((HttpServletResponse) response).sendRedirect("login_error.jsp");
        }
        else {
            chain.doFilter(request,response);
        }
    }
}
