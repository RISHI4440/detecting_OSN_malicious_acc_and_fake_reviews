<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String line = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/manet_new", "root", "root");

            String s = "D:\\Project\\OSN\\myUtility\\TrainDataset.arff";
            FileReader reader = new FileReader(s);
            BufferedReader br = new BufferedReader(reader);
            while ((line = br.readLine()) != null) {
                //read(br, null);
                br.readLine();
                System.out.println("BUFFER" + br.readLine());
                //            br.close();
                //            jTextArea1.requestFocus();

                String filepath = "NewKDD.arff";
                String content = br.readLine();
                System.out.println("CONTENT: " + br.readLine());

                int ii = 0;
                int ij = 0;
                int i = 0;
                int j = 0;
                String combine = null;
                ArrayList aa = new ArrayList();
                ArrayList aa1 = new ArrayList();

                ArrayList true_false_list = new ArrayList();
                PreparedStatement pst = con.prepareStatement("Select files_data from files");
                ResultSet rs = pst.executeQuery();

                while (rs.next()) {
                    //           System.out.println("Array List Of previous Database" + (rs.getString(1)));
                    aa.add(rs.getString(1));

                }

                System.out.println("===========Array List Of previous Database===================");
                for (j = 0; j < aa.size(); j++) {
                    //                System.out.println(aa.get(j));
                }

                StringTokenizer token = new StringTokenizer(content);

                while (token.hasMoreTokens()) {
                    // System.out.println(token.nextToken());
                    aa1.add(token.nextToken());

                }
                System.out.println("============Array List Of Current File==================");
                for (i = 0; i < aa1.size(); i++) {
                    //                    System.out.println(aa1.get(i));
                }

                //compare both array list
                for (i = 0; i < aa1.size(); i++) {
                    //                    System.out.println(aa1.get(i));
                    int flag = 0;
                    String first = aa1.get(i).toString();
                    for (j = 0; j < aa.size(); j++) {
                        String second = aa.get(j).toString();
                        //                        System.out.println(aa.get(j));
                        if (first.equals(second)) {
                            System.out.println("true for  " + first);
                            flag = 1;
                        } else {
                            //                             System.out.println("false for  "+first);
                        }
                    }
                    if (flag == 0) {
                        true_false_list.add("false");
                        //                    PreparedStatement pstmt = con.prepareStatement("insert into Files(file_path,files_data)values(?,?)");
                        //                    pstmt.setString(1, filepath);
                        //                    pstmt.setString(2, first);
                        //                    pstmt.executeUpdate();
                    } else {

                        PreparedStatement pstmt2 = con.prepareStatement("select same_data from Files where files_data=?");
                        pstmt2.setString(1, first);
                        ResultSet rs2 = pstmt2.executeQuery();

                        System.out.println("Samedata=" + first);
                        if ("0,tcp,http,SF,267,14515,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,4,4,0.00,0.00,0.00,0.00,1.00,0.00,0.00,155,255,1.00,0.00,0.01,0.03,0.01,0.00,0.00,0.00,normal".equals(first) || ("7428,tcp,telnet,SF,0,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0.00,0.00,0.00,0.00,1.00,0.00,0.00,255,217,0.85,0.03,0.00,0.00,0.33,0.39,0.12,0.06,anomaly".equals(first))) {
                            // JOptionPane.showMessageDialog(null, "DOS ATTACKED FOUND");

                        } else if ("0,tcp,daytime,S0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,197,3,1.00,1.00,0.00,0.00,0.02,0.06,0.00,255,3,0.01,0.07,0.00,0.00,1.00,1.00,0.00,0.00,anomaly".equals(first)) {
                            // JOptionPane.showMessageDialog(null, "Probe ATTACKED FOUND");

                        }
                        if (rs2.next()) {

                            String a = rs2.getString(1);
                            combine = filepath;
//                        combine = filepath + "," + a;
                            System.out.println("combination" + combine);
                            PreparedStatement pstmt4 = con.prepareStatement("UPDATE Files SET  same_data=? WHERE files_data=?");
                            pstmt4.setString(1, combine);
                            pstmt4.setString(2, first);
                            pstmt4.executeUpdate();

                        } else {

                            PreparedStatement pstmt1 = con.prepareStatement("UPDATE Files SET  same_data=? WHERE files_data=?");
                            pstmt1.setString(1, filepath);
                            pstmt1.setString(2, first);
                            pstmt1.executeUpdate();
                            true_false_list.add("true");

                        }
                    }
                }
                PreparedStatement pst1 = con.prepareStatement("Select files_data from files1");
                ResultSet rs1 = pst1.executeQuery();

                while (rs1.next()) {
                    //           System.out.println("Array List Of previous Database" + (rs.getString(1)));
                    aa.add(rs1.getString(1));

                }

                System.out.println("===========Array List Of previous Database===================");
                for (j = 0; j < aa.size(); j++) {
                    //                System.out.println(aa.get(j));
                }

                StringTokenizer token1 = new StringTokenizer(content);

                while (token1.hasMoreTokens()) {
                    // System.out.println(token.nextToken());
                    aa1.add(token1.nextToken());

                }
                System.out.println("============Array List Of Current File==================");
                for (i = 0; i < aa1.size(); i++) {
                    //                    System.out.println(aa1.get(i));
                }

                //compare both array list
                for (i = 0; i < aa1.size(); i++) {
                    //                    System.out.println(aa1.get(i));
                    int flag = 0;
                    String first = aa1.get(i).toString();
                    for (j = 0; j < aa.size(); j++) {
                        String second = aa.get(j).toString();
                        //                        System.out.println(aa.get(j));
                        if (first.equals(second)) {
                            System.out.println("true for  " + first);
                            flag = 1;
                        } else {
                            //                             System.out.println("false for  "+first);
                        }
                    }
                    if (flag == 0) {
                        true_false_list.add("false");
                        //                    PreparedStatement pstmt = con.prepareStatement("insert into Files(file_path,files_data)values(?,?)");
                        //                    pstmt.setString(1, filepath);
                        //                    pstmt.setString(2, first);
                        //                    pstmt.executeUpdate();
                    } else {

                        PreparedStatement pstmt2 = con.prepareStatement("select same_data from Files1 where files_data=?");
                        pstmt2.setString(1, first);
                        ResultSet rs2 = pstmt2.executeQuery();

                        System.out.println("Samedata=" + first);
                        if ("0,tcp,http,SF,267,14515,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,4,4,0.00,0.00,0.00,0.00,1.00,0.00,0.00,155,255,1.00,0.00,0.01,0.03,0.01,0.00,0.00,0.00,normal".equals(first) || ("7428,tcp,telnet,SF,0,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0.00,0.00,0.00,0.00,1.00,0.00,0.00,255,217,0.85,0.03,0.00,0.00,0.33,0.39,0.12,0.06,anomaly".equals(first))) {
                            //                        JOptionPane.showMessageDialog(null, "R2L ATTACKED FOUND");
                            //                        count++;

                        } else if ("0,tcp,daytime,S0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,197,3,1.00,1.00,0.00,0.00,0.02,0.06,0.00,255,3,0.01,0.07,0.00,0.00,1.00,1.00,0.00,0.00,anomaly".equals(first)) {
                            // JOptionPane.showMessageDialog(null, "U2R ATTACKED FOUND");

                        }
                        if (rs2.next()) {

                            String a = rs2.getString(1);

                            combine = filepath + "," + a;
                            System.out.println("combination" + combine);
                            PreparedStatement pstmt4 = con.prepareStatement("UPDATE Files1 SET  same_data=? WHERE files_data=?");
                            pstmt4.setString(1, combine);
                            pstmt4.setString(2, first);
                            pstmt4.executeUpdate();

                        } else {

                            PreparedStatement pstmt1 = con.prepareStatement("UPDATE Files1 SET  same_data=? WHERE files_data=?");
                            pstmt1.setString(1, filepath);
                            pstmt1.setString(2, first);
                            pstmt1.executeUpdate();
                            true_false_list.add("true");

                        }
                    }
                }
                PreparedStatement pst2 = con.prepareStatement("Select files_data from files2");
                ResultSet rs2 = pst2.executeQuery();

                while (rs2.next()) {
                    //           System.out.println("Array List Of previous Database" + (rs.getString(1)));
                    aa.add(rs2.getString(1));

                }

                System.out.println("===========Array List Of previous Database===================");
                for (j = 0; j < aa.size(); j++) {
                    //                System.out.println(aa.get(j));
                }

                StringTokenizer token2 = new StringTokenizer(content);

                while (token2.hasMoreTokens()) {
                    // System.out.println(token.nextToken());
                    aa1.add(token2.nextToken());

                }
                System.out.println("============Array List Of Current File==================");
                for (i = 0; i < aa1.size(); i++) {
                    //                    System.out.println(aa1.get(i));
                }

                //compare both array list
                for (i = 0; i < aa1.size(); i++) {
                    //                    System.out.println(aa1.get(i));
                    int flag = 0;
                    String first = aa1.get(i).toString();
                    for (j = 0; j < aa.size(); j++) {
                        String second = aa.get(j).toString();
                        //                        System.out.println(aa.get(j));
                        if (first.equals(second)) {
                            System.out.println("true for  " + first);
                            flag = 1;
                        } else {
                            //                             System.out.println("false for  "+first);
                        }
                    }
                    if (flag == 0) {
                        true_false_list.add("false");
                        //                    PreparedStatement pstmt = con.prepareStatement("insert into Files(file_path,files_data)values(?,?)");
                        //                    pstmt.setString(1, filepath);
                        //                    pstmt.setString(2, first);
                        //                    pstmt.executeUpdate();
                    } else {

                        PreparedStatement pstmt2 = con.prepareStatement("select same_data from Files2 where files_data=?");
                        pstmt2.setString(1, first);
                        ResultSet rs3 = pstmt2.executeQuery();

                        System.out.println("Samedata=" + first);
                        if ("0,tcp,http,SF,267,14515,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,4,4,0.00,0.00,0.00,0.00,1.00,0.00,0.00,155,255,1.00,0.00,0.01,0.03,0.01,0.00,0.00,0.00,normal".equals(first) || ("7428,tcp,telnet,SF,0,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0.00,0.00,0.00,0.00,1.00,0.00,0.00,255,217,0.85,0.03,0.00,0.00,0.33,0.39,0.12,0.06,anomaly".equals(first))) {

                        } else if ("0,tcp,daytime,S0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,197,3,1.00,1.00,0.00,0.00,0.02,0.06,0.00,255,3,0.01,0.07,0.00,0.00,1.00,1.00,0.00,0.00,anomaly".equals(first)) {

                        }
                        if (rs2.next()) {

                            String a = rs2.getString(1);

                            combine = filepath + "," + a;
                            System.out.println("combination" + combine);
                            PreparedStatement pstmt4 = con.prepareStatement("UPDATE Files2 SET  same_data=? WHERE files_data=?");
                            pstmt4.setString(1, combine);
                            pstmt4.setString(2, first);
                            pstmt4.executeUpdate();

                        } else {

                            PreparedStatement pstmt1 = con.prepareStatement("UPDATE Files2 SET  same_data=? WHERE files_data=?");
                            pstmt1.setString(1, filepath);
                            pstmt1.setString(2, first);
                            pstmt1.executeUpdate();
                            true_false_list.add("true");

                        }
                    }
                }

                for (Object object : true_false_list) {
                    System.out.println(object);
                }

            }
            response.sendRedirect("compare.jsp");
        %>
    </body>
</html>
