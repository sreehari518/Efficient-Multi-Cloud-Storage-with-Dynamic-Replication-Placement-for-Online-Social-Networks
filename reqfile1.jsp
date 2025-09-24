<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Greendeer | Blog</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-quicksand.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = document.getElementById("t4").value;

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}



</script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
<a href="index.html">       <h2 align=center style="color:#FFFFFF;"><b>Efficient Multi-Cloud Storage Using Online Dynamic Replication And Placement Algorithms For Online Social Networks</h1></span> </a>

      </div>
      <div class="searchform">
        <form id="formsearch" name="formsearch" method="post" action="#">
          <span>
          <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
          </span>
          <input name="button_search" src="images/search.gif" class="button_search" type="image" />
        </form>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /></a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
         
          <li class="active" ><a href="viewfilesall.jsp"><span>View Files</span></a></li>
          <li class="active" ><a href="reqfile.jsp"><span>Search Files</span></a></li>
          <li class="active"><a href="index.html"><span>Logout</span></a></li>

          
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
        
          <div class="mainbar">
            <div class="article">
            <p>&nbsp;</p>
              <h2>View Cloud Files </h2>
              			  <br />
              

<%

	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int j=0,k=0;

      	try 
	{
        
           String cname=request.getParameter("t1");  
		    String fname=request.getParameter("t2");
			 String oname=request.getParameter("t3");
			  String sk=request.getParameter("t4");    
           String uname=(String)application.getAttribute("uname");
           
           Statement st=connection.createStatement();
           
           SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
      		 
      		
String query4="select cname from user where uname='"+uname+"'";  
      Statement st4=connection.createStatement();
String clo=" ";
ResultSet rs8=	st4.executeQuery(query4);
	if(rs8.next())
                        clo = rs8.getString("cname");

String query2="select count(*) from udownloads where fname='"+fname+"'  or an  like '%"+oname +"%' and ip = '" + clo + "'";  

	           
	           ResultSet rs2=st.executeQuery(query2);
			
int i =0		;
	if(rs2.next())
			{
				 i=rs2.getInt(1);


				
				if(i<=2000)
				{
String query="select * from cfiles where fname='"+fname+"'  or pt  like '%"+oname +"%'"; 
			          
			           ResultSet rs=st.executeQuery(query);
				if ( rs.next() )
				   {
					
					s2=rs.getString("pt");
					
				
					%>

			  <table width="200" border="1" align="center">
			  <tr>
			    <td><span class="style2">Cloud Name </span></td>
			    <td><%= cname %></td>
			  </tr>

			  <tr>
			    <td><span class="style2">File Name </span></td>
			    <td><input type="text" name="t4" id="t4" value="<%= fname %>" readonly /></td>
			  </tr>
			  <tr>
			    <td><span class="style2">File Content </span></td>
			    <td><textarea name="textarea" id="textarea" cols="50" rows="15"><%= s2 %></textarea></td>
			  </tr>
			  <tr>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			  </tr>
			  <tr>
			    <td>&nbsp;</td>
			    <td><button onClick="saveTextAsFile()">Download</button></td>
			  </tr>
			</table>

			<%

				if(i>=10)
				      {
           Statement st8=connection.createStatement();
           Statement st9=connection.createStatement();

sk = "39d6479a8381f36c83e363554a4604aa951d34a";

st8.executeUpdate("insert into  cfiles (oname,cname,fname,mac,key1,key2,pt,ct,dt) values ('auto' ,'"+clo+"','"+fname+"','"+sk+"',null,null,'"+s2+"','"+s2+"',null)");


				}




			String ip_h = request.getRemoteAddr();  
			String host_h = request.getRemoteHost(); 
			st.executeUpdate(" insert into udownloads values ('"+uname+"','"+cname+"','"+fname+"','"+sk+"','"+clo+"','"+s2+"','"+strDate+"') ");

				   }
				}
				if(i>2000)
				{
					String ip_h = request.getRemoteAddr();  
					String host_h = request.getRemoteHost(); 
					
					st.executeUpdate(" insert into Attackers values ('"+uname+"','"+cname+"','Downloading File to the Cloud','"+ip_h+"','"+host_h+"','"+dt+"') ");
					
					out.println("LIMIT FOR DOWNLOADING IS EXPIRED...!");
				
				
				%><p><a href="reqfile.jsp">Back</a></p>



			<%
				}
			}
			else
			{
				String query="select * from cfiles where cname='"+cname+"' and fname='"+fname+"' and oname='"+oname+"' and key2='"+sk+"'  "; 
		          
		           ResultSet rs=st.executeQuery(query);
			if ( rs.next() )
			   {
				
				s2=rs.getString("pt");
				
			
				%>

		  <table width="200" border="1" align="center">
		  <tr>
		    <td><span class="style2">Cloud Name </span></td>
		    <td><%= cname %></td>
		  </tr>
		  <tr>
		    <td><span class="style2">Owner Name </span></td>
		    <td><%= oname %></td>
		  </tr>
		  <tr>
		    <td><span class="style2">File Name </span></td>
		    <td><input type="text" name="t4" id="t4" value="<%= fname %>" readonly /></td>
		  </tr>
		  <tr>
		    <td><span class="style2">File Content </span></td>
		    <td><textarea name="textarea" id="textarea" cols="50" rows="15"><%= s2 %></textarea></td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td><button onClick="saveTextAsFile()">Download</button></td>
		  </tr>
		</table>

		<%

		String ip_h = request.getRemoteAddr();  
		String host_h = request.getRemoteHost(); 
		st.executeUpdate(" insert into udownloads values ('"+uname+"','"+cname+"','"+fname+"','"+sk+"','"+ip_h+"','"+host_h+"','"+strDate+"') ");

			   }
			}
		
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>

            </div>
          </div>
        </div>
        <div class="article">
          <h2>&nbsp;</h2>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">

          <div class="clr"></div>
          <ul class="sb_menu">
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>&nbsp;</h2>
        </div>
      <div class="col c2">
        <h2>&nbsp;</h2>
      </div>
      <div class="col c3">
        <h2>&nbsp;</h2>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="rf">&nbsp;</p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
