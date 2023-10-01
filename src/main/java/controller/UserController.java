package controller;

import database.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.annotation.MultipartConfig;

import model.User;
import org.apache.commons.io.*;

import util.SHA512;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import static java.lang.System.out;

@WebServlet("/users")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public UserController(){
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String pathInfo = request.getPathInfo();
        out.println(pathInfo);
        if (pathInfo == null) {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else if (pathInfo.equals("/login")) {
            out.println("login");
            login(request,response);
        } else if (pathInfo.equals("/register")) {
            out.println("register");
            register(request, response);
        } else if (pathInfo.equals("/update")) {
            out.println("update");
            update(request,response);
        } else if (pathInfo.equals("/upload")) {
            upload(request,response);
        }else if (pathInfo.equals("/logout")) {
            out.println("logout");
            logout(request,response);
        }else {
            out.println("no");
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doGet(request, response);
    }
    private void register(HttpServletRequest request, HttpServletResponse response){
        try {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("password", password);
        request.setAttribute("rePassword", rePassword);
        String error = "";
        String url = "";
        UserDAO userDAO = new UserDAO();
        if(userDAO.checkUser(username)){
            error = "Username exists!\n";
        }
        if(!password.equals(rePassword)){
            error += "Password do not match!\n";
        }else {
            password = SHA512.hash(password);
        }
        request.setAttribute("error", error);
        if(!error.isEmpty()){
            request.setAttribute("error", error);
            url = "/user/register.jsp";
        }
        else {
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            int a = new UserDAO().insert(user);
            String success = "";
            if(a>0){
                success = "Signup success. Please Login";
                request.setAttribute("success", success);
                url = "/user/login.jsp";
            }
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        password = SHA512.hash(password);
        UserDAO userDAO = new UserDAO();
        String url = "";
        if(userDAO.login(username,password)){
            request.getSession().setAttribute("user", username);
            url = "/index.jsp";
        }else {
            String error = "username/password incorrect";
            request.setAttribute("error", error);
            url = "/user/login.jsp";
        }
        response.sendRedirect(request.getContextPath() + url);

    }
    private void logout(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("/user/login.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void update(HttpServletRequest request, HttpServletResponse response){
        try {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String profile = request.getParameter("profile");
        String name = (String) request.getSession().getAttribute("user");
        UserDAO userDAO = new UserDAO();
        String error ="";
        String url = "";
        String success = "";
        if(!userDAO.checkUser(username) || username.equals(name)){
            int a = userDAO.update(name, username, email, profile);
            if (a > 0) {
                success = "Update success!";
                request.setAttribute("success", success);
                request.getSession().setAttribute("user", username);
                url = "/user/profile.jsp";
            }
        }
        else {
            error = "username exists!";
            request.setAttribute("error", error);
            url = "/user/profile.jsp";
        }
        response.sendRedirect(request.getContextPath() + url);
        } catch ( IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contentType = request.getContentType();
        if (contentType != null && contentType.startsWith("multipart/")) {
            String dir       = request.getSession().getServletContext().getRealPath("/img/");
            File   uploadDir = new File(dir);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            Collection<Part> parts = request.getParts();
            for (Part part : parts) {
                String fileName = part.getSubmittedFileName();
                if (fileName != null) {
                    File uploadFile = new File(uploadDir, fileName);
                    System.out.println(uploadFile.getAbsolutePath());
                } else {
                    System.out.println(IOUtils.toString(part.getInputStream()));
                }
            }
            response.sendRedirect(request.getContextPath() + "/user/profile.jsp");
        }
    }
}



