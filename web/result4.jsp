
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%@page import="ChartDirector.*" %>
        <br>
        <br>
        <%@include file="result_header.jsp"%>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
    <center><h3>The percentage of recharge from promotion activities.</h3>
       <%!
            
            double[] data1 =new double[10];;
            double[] data2 =new double[10];;
           
        %>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
                PreparedStatement p = conn.prepareStatement("SELECT `BwdELCA`,`TDELCa-L` FROM result4");
                ResultSet rs = p.executeQuery();
                int i=0;
                while (rs.next()) {
                    String a = rs.getString("BwdELCa");
                    System.out.print(a);
                    data1[i]=Double.parseDouble(a);
                    String b = rs.getString("TDELCa-L");
                    System.out.print(b);
                      data2[i]=Double.parseDouble(b);
                    i++;
                }

            } catch (Exception e) {

                System.out.println(e);

            }

        %>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <%
        // The data for the chart
//            double[] data0 = {0,100 , 50, 75, 100};
//            double[] data1 = {50, 55, 47, 34, 47, 53, 38, 40, 51};

        // The labels for the chart
            String[] labels = {"0.00", "", "0.25", "", "0.50", "", "0.75", "", "1.00"};

        // Create a XYChart object of size 600 x 300 pixels, with a pale red (ffdddd) background, black
        // border, 1 pixel 3D border effect and rounded corners.
            XYChart c = new XYChart(600, 300, 0xffdddd, 0x000000, 1);
            c.setRoundedFrame();

        //Set search path to current JSP directory for loading icon images
            c.setSearchPath(getServletConfig().getServletContext(), request);

        // Set the plotarea at (55, 58) and of size 520 x 195 pixels, with white (ffffff) background. Set
        // horizontal and vertical grid lines to grey (cccccc).
            c.setPlotArea(55, 58, 520, 195, 0xffffff, -1, -1, 0xcccccc, 0xcccccc);

        // Add a legend box at (55, 32) (top of the chart) with horizontal layout. Use 9pt Arial Bold font.
        // Set the background and border color to Transparent.
            c.addLegend(55, 32, false, "Arial Bold", 9).setBackground(Chart.Transparent);

        // Add a title box to the chart using 15pt Times Bold Italic font. The title is in CDML and includes
        // embedded images for highlight. The text is white (ffffff) on a dark red (880000) background, with
        // soft lighting effect from the right side.
            c.addTitle("","Times New Roman Bold Italic", 15, 0xffffff
            ).setBackground(0x880000, -1, Chart.softLighting(Chart.Right));

        // Add a title to the y axis
            c.yAxis().setTitle("CDF");

        // Set the labels on the x axis
            c.xAxis().setLabels(labels);

        // Add a title to the x axis using CMDL
            c.xAxis().setTitle("The percentage of recharge from promotion activities.");

        // Set the axes width to 2 pixels
            c.xAxis().setWidth(2);
            c.yAxis().setWidth(2);

        // Add a spline layer to the chart
            SplineLayer layer = c.addSplineLayer();

        // Set the default line width to 2 pixels
            layer.setLineWidth(2);

        // Add a data set to the spline layer, using blue (0000c0) as the line color, with yellow (ffff00)
        // circle symbols.
            layer.addDataSet(data1, 0x0000c0, "Malitious Accounts").setDataSymbol(Chart.CircleSymbol, 9, 0xffff00);

        // Add a data set to the spline layer, using brown (982810) as the line color, with pink (f040f0)
        // diamond symbols.
            layer.addDataSet(data2, 0x982810, "Benign Account").setDataSymbol(Chart.DiamondSymbol, 11, 0xf040f0);

        // Add a custom CDML text at the bottom right of the plot area as the logo
            c.addText(575, 250,
                    "<*block,valign=absmiddle*><*img=small_molecule.png*> <*block*><*font=Times New Roman Bold "
                    + "Italic,size=10,color=804040*><*/*>").setAlignment(Chart.BottomRight);

        // Output the chart
            String chart1URL = c.makeSession(request, "chart1");

        // Include tool tip for the chart
            String imageMap1 = c.getHTMLImageMap("", "",
                    "title='{dataSetName} at t = {xLabel} hour: {value} KJ/liter'");
        %>

            <div style="font-size:18pt; font-family:verdana; font-weight:bold">
                 
            </div>
            <hr color="#000080">
            <div style="font-size:10pt; font-family:verdana; margin-bottom:1.5em">
              
            </div>
            <img src='<%=response.encodeURL("getchart.jsp?" + chart1URL)%>'
                 usemap="#map1" border="0">
            <map name="map1"><%=imageMap1%></map>
    </center>
</body>
</html>
