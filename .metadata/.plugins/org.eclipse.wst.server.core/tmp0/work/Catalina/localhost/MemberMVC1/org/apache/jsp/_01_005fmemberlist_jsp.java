/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.0.27
 * Generated at: 2024-02-02 09:35:37 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import kr.basic.member.Member;
import kr.basic.member.MemberDAO;
import java.util.ArrayList;

public final class _01_005fmemberlist_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/header.jsp", Long.valueOf(1706865207072L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("kr.basic.member.Member");
    _jspx_imports_classes.add("kr.basic.member.MemberDAO");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"./css/style.css\" />\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("  <header>\r\n");
      out.write("          <div class=\"row\">  <!--py-3(y축으로) 높이 column row )-->\r\n");
      out.write("            <div class=\"w-50 py-3\" onclick=\"location.href='01_memberlist.jsp'\"> 회원목록 </div>\r\n");
      out.write("            \r\n");
      out.write("            ");
if(session.getAttribute("log")==null){ 
      out.write("\r\n");
      out.write("            <div class=\"w-25 py-3\" onclick=\"location.href='04_memberInsert.jsp'\"> 회원가입 </div>\r\n");
      out.write("            <div class=\"w-25 py-3\"  onclick=\"location.href='02_memberLogin.jsp'\"> 로그인 </div>\r\n");
      out.write("            ");
}else{ 
      out.write("\r\n");
      out.write("     \r\n");
      out.write("                    <div class=\"w-25 py-3\" onclick=\"location.href='05_memberContent.jsp?num=");
      out.print((int)session.getAttribute("log") );
      out.write("'\"> 내정보 </div>\r\n");
      out.write("                    <div class=\"w-25 py-3\" onclick=\"location.href='03_memberLogoutPro.jsp'\"> 로그아웃 </div>\r\n");
      out.write("            ");
} 
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("</header>\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');

ArrayList<Member> list = MemberDAO.getInstance().getMemberList();

      out.write("\r\n");
      out.write("<h1 class=\"py-3\"> 회원 목록</h1>\r\n");
      out.write("\r\n");
      out.write("<table class=\" py-10 table table-bordered\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td>번호</td>\r\n");
      out.write("    <td>아이디</td>\r\n");
      out.write("    <td>비밀번호</td>\r\n");
      out.write("    <td>이름</td>\r\n");
      out.write("    <td>나이</td>\r\n");
      out.write("    <td>이메일</td>\r\n");
      out.write("    <td>전화번호</td>\r\n");
      out.write("    <td>삭제</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  ");
 for(Member vo : list){ 
      out.write("\r\n");
      out.write("    	  <tr>\r\n");
      out.write("    	    <td>");
      out.print(vo.getNum());
      out.write("</td>\r\n");
      out.write("    	    <td><a href=\"05_memberContent.jsp?num=");
      out.print(vo.getNum());
      out.write('"');
      out.write('>');
      out.print(vo.getId());
      out.write("</a></td>\r\n");
      out.write("    	    <td>");
      out.print(vo.getPass());
      out.write("</td>\r\n");
      out.write("    	    <td>");
      out.print(vo.getName());
      out.write("</td>\r\n");
      out.write("    	    <td>");
      out.print(vo.getAge());
      out.write("</td>\r\n");
      out.write("    	    <td>");
      out.print(vo.getEmail());
      out.write("</td>\r\n");
      out.write("    	    <td>");
      out.print(vo.getPhone());
      out.write("</td>\r\n");
      out.write("    	    <td><input type=\"button\" value=\"삭제\" class=\"btn btn-outline-dark\" onclick=\"location.href='06_memberDeletePro.jsp?num=");
      out.print(vo.getNum());
      out.write("'\"></td>\r\n");
      out.write("    	  </tr>    	 \r\n");
      out.write("  ");
 } 
      out.write("\r\n");
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
