
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadServlet12")
@MultipartConfig(maxFileSize = 16177215)	// upload file's size up to 16MB
public class uploadServlet12 extends HttpServlet {

    // database connection settings
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");

        InputStream inputStream = null;	// input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }

        try {
            // connects to the database
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");

            
            String sql = "INSERT INTO seller_insertion (first_name, last_name, photo) values (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, firstName);
            statement.setString(2, lastName);

            
                // fetches input stream of the upload file for the blob column
                statement.setBlob(3, inputStream, (int) filePart.getSize());
        

            // sends the statement to the database server
            statement.executeUpdate();
            
        } catch (SQLException ex) {
            
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(uploadServlet12.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
