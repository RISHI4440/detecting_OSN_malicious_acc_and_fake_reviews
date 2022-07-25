import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class UploadServlet11 extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                
         try {
             Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
            String s = "";
            Part filePart = request.getPart("myfile");
            if (filePart != null) {
                s = filePart.getSubmittedFileName();
            }
            System.out.println("file name is=" + s);

         //   String fileName = ;
         // This will reference one line at a time
        String line = null;
       
            // FileReader reads text files in the default encoding.
            FileReader fileReader = new FileReader("D:\\Project\\OSN\\myUtility\\"+s);

            // Always wrap FileReader in BufferedReader.
            BufferedReader bufferedReader = new BufferedReader(fileReader);

            while((line = bufferedReader.readLine()) != null) {
               // System.out.println(line);
                       
            String a=line;    
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO test1(file_data)VALUES (?)");
            System.out.println(""+a);
            pstmt.setString(1, a);
            pstmt.executeUpdate();
            } 
                // Always close files.
            bufferedReader.close(); 
            
            } catch (Exception e) {
            e.printStackTrace();
        }
         
        response.sendRedirect("Testing.jsp");
        
        
        
        
        
        
        
       
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
