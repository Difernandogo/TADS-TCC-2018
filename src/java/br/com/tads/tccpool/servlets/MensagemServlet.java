/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.tads.tccpool.servlets;

import br.com.tads.tccpool.beans.Mensagem;
import br.com.tads.tccpool.beans.User;
import br.com.tads.tccpool.facade.MensagemFacade;
import br.com.tads.tccpool.facade.NotificacaoFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Marcos
 */
@WebServlet(name = "MensagemServlet", urlPatterns = {"/MensagemServlet"})
public class MensagemServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            //Validação de acesso
            if(session == null) {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                request.setAttribute("title", "Inicio");
                request.setAttribute("msg", "Faça login para acessar esta página!");
                rd.forward(request, response);
            }
            
            User userLogado = (User)session.getAttribute("user");
            String retornoListar = "";
            
            
            String action = (String) request.getParameter("action").trim();
            
            switch(action) {
                case "ADD_MENSAGEM":
                    Mensagem mensagem = new Mensagem();
                    mensagem.setIdOrigem(Integer.parseInt(request.getParameter("ID_ORIGEM")));
                    mensagem.setIdDestino(Integer.parseInt(request.getParameter("ID_DESTINO")));
                    mensagem.setConteudo((String) request.getParameter("DS_MSG"));
                    
                    String retornoInserir = MensagemFacade.inserir(mensagem);
                    
                     //notificação
                    int idO = Integer.parseInt(request.getParameter("ID_ORIGEM"));
                    int idD = Integer.parseInt(request.getParameter("ID_DESTINO"));
                    NotificacaoFacade.inserirnotificacao(idO, idD, 7);
                    
                    out.write(retornoInserir);
                    out.flush();                    
                    break;
                    
                case "LIST_MENSAGEM":
                    //int idConversa = Integer.parseInt(request.getParameter("ID_CONVERSA"));
                    int idOrigem = Integer.parseInt(request.getParameter("ID_ORIGEM"));
                    int idDestino = Integer.parseInt(request.getParameter("ID_DESTINO"));
                    retornoListar = MensagemFacade.listar(idOrigem, idDestino, userLogado);
                                                   
                    out.write(retornoListar);
                    out.flush();
                    break;
                    
                case "LIST_CONVERSA":
                    retornoListar = MensagemFacade.listarConversas(userLogado.getId());
                    
                    out.write(retornoListar);
                    out.flush();
                    break;
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MensagemServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MensagemServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
