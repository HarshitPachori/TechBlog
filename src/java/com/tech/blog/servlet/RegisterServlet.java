package com.tech.blog.servlet;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig   // annotation to accept any type of data such as image , etc and without this the servlet cannot find the type of dataand thus does not load it 

public class RegisterServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
//            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
// upr wali comment krke ab ham data fetch krne ke liye next line se code likhege
// fetch all form data
// ham reg jsp pr form me action diya aur method likha fir name email password or baaki ke input field pr name lagaya unko fetch krne ke liye 
String check = request.getParameter("check");
if(check == null){
    // agr user ne check kiya hai 
    out.println("Box not checked");
}else{
    // baki ka data yahan nikalna hai
    String name = request.getParameter("user_name");
        String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
                String gender = request.getParameter("gender");
                    String about = request.getParameter("about");
                    // create user object and put user data to thgat object
                    User user = new User(name,email,password,gender,about);
                    // create a user dao object to save user to db
                    UserDao dao = new UserDao(ConnectionProvider.getConnection()); // connection provider class hamne shuru me banayi thi databse se connect hone keliye
                    if(dao.saveUser(user)){
                        // agr data save go jaye to
                        out.println("done");
                    }else{
                        out.println("error");
                    }
                    




}







            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
