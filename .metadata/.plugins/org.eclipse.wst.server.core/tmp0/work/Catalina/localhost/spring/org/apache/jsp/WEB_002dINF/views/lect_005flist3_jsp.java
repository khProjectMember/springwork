/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.70
 * Generated at: 2023-01-07 23:31:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class lect_005flist3_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/E:/springwork/finalPro/src/main/webapp/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/c.tld", Long.valueOf(1425946270000L));
    _jspx_dependants.put("/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar", Long.valueOf(1672981764611L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
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

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
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

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
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

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>강좌목록</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"resources/css/lect_list3.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "common/header.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("<form id=\"\" method=\"\" action=\"\" enctype=\"multipart/form-data\">\r\n");
      out.write("	<div id=\"wrap\">\r\n");
      out.write("	     <div id=\"content\">\r\n");
      out.write("	          <div class=\"inner\">\r\n");
      out.write("				 <div class=\"container\">\r\n");
      out.write("    <h1>정글 시네마 영화 목록</h1>\r\n");
      out.write("    <nav>\r\n");
      out.write("      <a class=\"tit-now\" href=\"javascript:void(0)\">현재 상영 영화</a>\r\n");
      out.write("      <a class=\"tit-notOpen\" href=\"javascript:void(0)\">개봉예정영화</a>\r\n");
      out.write("      <a class=\"tit-boxoffice\" href=\"javascript:void(0)\">박스오피스</a>\r\n");
      out.write("    </nav>\r\n");
      out.write("\r\n");
      out.write("    <ul class=\"cont-movie\">\r\n");
      out.write("      <li class=\"item-movie\">\r\n");
      out.write("        <img src=\"resources/img/ex1.jpg\" alt=\"위니브 월드\">\r\n");
      out.write("        <strong class=\"movieTitle\">\r\n");
      out.write("          위니브 월드 : 새로운 시대\r\n");
      out.write("        </strong>\r\n");
      out.write("        <dl>\r\n");
      out.write("          <dt>개요</dt>\r\n");
      out.write("          <dd>판타지</dd>\r\n");
      out.write("          <dt>평점</dt>\r\n");
      out.write("          <dd>9.05</dd>\r\n");
      out.write("          <dt>개봉</dt>\r\n");
      out.write("          <dd>2021.03.27</dd>\r\n");
      out.write("          <dt>출연</dt>\r\n");
      out.write("          <dd>라이캣, 소울곰, 개리씨</dd>\r\n");
      out.write("\r\n");
      out.write("        </dl>\r\n");
      out.write("        <div class=\"cont-btn\">\r\n");
      out.write("          <button class=\"btn-ticket\">예매하기</button>\r\n");
      out.write("          <button class=\"btn-teaser\">예고편</button>\r\n");
      out.write("        </div>\r\n");
      out.write("      </li>\r\n");
      out.write("\r\n");
      out.write("      <li class=\"item-movie\">\r\n");
      out.write("        <img src=\"resources/img/ex1.jpg\" alt=\"눈떠보니 코딩테스트 전날\">\r\n");
      out.write("        <strong class=\"movieTitle\">\r\n");
      out.write("          눈떠보니 코딩테스트 전날\r\n");
      out.write("        </strong>\r\n");
      out.write("        <dl>\r\n");
      out.write("          <dt>개요</dt>\r\n");
      out.write("          <dd>스릴러</dd>\r\n");
      out.write("          <dt>평점</dt>\r\n");
      out.write("          <dd>8.25</dd>\r\n");
      out.write("          <dt>개봉</dt>\r\n");
      out.write("          <dd>2021.04.01</dd>\r\n");
      out.write("          <dt>출연</dt>\r\n");
      out.write("          <dd>자바독, 개리씨, 빙키</dd>\r\n");
      out.write("        </dl>\r\n");
      out.write("        <div class=\"cont-btn\">\r\n");
      out.write("          <button class=\"btn-ticket\">예매하기</button>\r\n");
      out.write("          <button class=\"btn-teaser\">예고편</button>\r\n");
      out.write("        </div>\r\n");
      out.write("      </li>\r\n");
      out.write("      <li class=\"item-movie\">\r\n");
      out.write("        <img src=\"resources/img/ex1.jpg\" alt=\"파이썬 부트캠프\">\r\n");
      out.write("        <strong class=\"movieTitle\">\r\n");
      out.write("          파이썬 부트캠프\r\n");
      out.write("        </strong>\r\n");
      out.write("        <dl>\r\n");
      out.write("          <dt>개요</dt>\r\n");
      out.write("          <dd>드라마</dd>\r\n");
      out.write("          <dt>평점</dt>\r\n");
      out.write("          <dd>8.77</dd>\r\n");
      out.write("          <dt>개봉</dt>\r\n");
      out.write("          <dd>2021.04.12</dd>\r\n");
      out.write("          <dt>출연</dt>\r\n");
      out.write("          <dd>캣, 파이, 썬, 뮤라</dd>\r\n");
      out.write("\r\n");
      out.write("        </dl>\r\n");
      out.write("        <div class=\"cont-btn\">\r\n");
      out.write("          <button class=\"btn-ticket\">예매하기</button>\r\n");
      out.write("          <button class=\"btn-teaser\">예고편</button>\r\n");
      out.write("        </div>\r\n");
      out.write("      </li>\r\n");
      out.write("      <li class=\"item-movie\">\r\n");
      out.write("        <img src=\"resources/img/ex1.jpg\" alt=\"파이큐티의 사랑\">\r\n");
      out.write("        <strong class=\"movieTitle\">\r\n");
      out.write("          파이큐티의 사랑\r\n");
      out.write("        </strong>\r\n");
      out.write("        <dl>\r\n");
      out.write("          <dt>개요</dt>\r\n");
      out.write("          <dd>로맨스</dd>\r\n");
      out.write("          <dt>평점</dt>\r\n");
      out.write("          <dd>8.81</dd>\r\n");
      out.write("          <dt>개봉</dt>\r\n");
      out.write("          <dd>2021.04.08</dd>\r\n");
      out.write("          <dt>출연</dt>\r\n");
      out.write("          <dd>파이썬, 큐티</dd>\r\n");
      out.write("        </dl>\r\n");
      out.write("        <div class=\"cont-btn\">\r\n");
      out.write("          <button class=\"btn-ticket\">예매하기</button>\r\n");
      out.write("          <button class=\"btn-teaser\">예고편</button>\r\n");
      out.write("        </div>\r\n");
      out.write("      </li>\r\n");
      out.write("      <li class=\"item-movie\">\r\n");
      out.write("        <img src=\"resources/img/ex1.jpg\" alt=\"NGINX의 춤\">\r\n");
      out.write("        <strong class=\"movieTitle\">\r\n");
      out.write("          NGINX의 춤\r\n");
      out.write("        </strong>\r\n");
      out.write("        <dl>\r\n");
      out.write("          <dt>개요</dt>\r\n");
      out.write("          <dd>드라마</dd>\r\n");
      out.write("          <dt>평점</dt>\r\n");
      out.write("          <dd>9.88</dd>\r\n");
      out.write("          <dt>개봉</dt>\r\n");
      out.write("          <dd>2021.04.15</dd>\r\n");
      out.write("          <dt>출연</dt>\r\n");
      out.write("          <dd>NGINX, 노션</dd>\r\n");
      out.write("\r\n");
      out.write("        </dl>\r\n");
      out.write("        <div class=\"cont-btn\">\r\n");
      out.write("          <button class=\"btn-ticket\">예매하기</button>\r\n");
      out.write("          <button class=\"btn-teaser\">예고편</button>\r\n");
      out.write("        </div>\r\n");
      out.write("      </li>\r\n");
      out.write("      <li class=\"item-movie\">\r\n");
      out.write("        <img src=\"resources/img/ex1.jpg\" alt=\"어쩌다 밋업\">\r\n");
      out.write("        <strong class=\"movieTitle\">\r\n");
      out.write("          어쩌다 밋업\r\n");
      out.write("        </strong>\r\n");
      out.write("        <dl>\r\n");
      out.write("          <dt>개요</dt>\r\n");
      out.write("          <dd>드라마</dd>\r\n");
      out.write("          <dt>평점</dt>\r\n");
      out.write("          <dd>9.25</dd>\r\n");
      out.write("          <dt>개봉</dt>\r\n");
      out.write("          <dd>2021.04.17</dd>\r\n");
      out.write("          <dt>출연</dt>\r\n");
      out.write("          <dd>라이캣, 자바독, 소울곰</dd>\r\n");
      out.write("\r\n");
      out.write("        </dl>\r\n");
      out.write("        <div class=\"cont-btn\">\r\n");
      out.write("          <button class=\"btn-ticket\">예매하기</button>\r\n");
      out.write("          <button class=\"btn-teaser\">예고편</button>\r\n");
      out.write("        </div>\r\n");
      out.write("      </li>\r\n");
      out.write("      <li class=\"item-movie\">\r\n");
      out.write("        <img src=\"resources/img/ex1.jpg\" alt=\"파이게임 어드벤처\">\r\n");
      out.write("        <strong class=\"movieTitle\">\r\n");
      out.write("          파이게임 어드밴처\r\n");
      out.write("        </strong>\r\n");
      out.write("        <dl>\r\n");
      out.write("          <dt>개요</dt>\r\n");
      out.write("          <dd>판타지액션</dd>\r\n");
      out.write("          <dt>평점</dt>\r\n");
      out.write("          <dd>8.56</dd>\r\n");
      out.write("          <dt>개봉</dt>\r\n");
      out.write("          <dd>2021.04.05</dd>\r\n");
      out.write("          <dt>출연</dt>\r\n");
      out.write("          <dd>개리씨, 파이썬</dd>\r\n");
      out.write("\r\n");
      out.write("        </dl>\r\n");
      out.write("        <div class=\"cont-btn\">\r\n");
      out.write("          <button class=\"btn-ticket\">예매하기</button>\r\n");
      out.write("          <button class=\"btn-teaser\">예고편</button>\r\n");
      out.write("        </div>\r\n");
      out.write("      </li>\r\n");
      out.write("      <li class=\"item-movie\">\r\n");
      out.write("        <img src=\"resources/img/ex1.jpg\" alt=\"MBIT는 내 운명\">\r\n");
      out.write("        <strong class=\"movieTitle\">\r\n");
      out.write("          MBIT는 내 운명\r\n");
      out.write("        </strong>\r\n");
      out.write("        <dl>\r\n");
      out.write("          <dt>개요</dt>\r\n");
      out.write("          <dd>로맨스</dd>\r\n");
      out.write("          <dt>평점</dt>\r\n");
      out.write("          <dd>9.02</dd>\r\n");
      out.write("          <dt>개봉</dt>\r\n");
      out.write("          <dd>2021.04.12</dd>\r\n");
      out.write("          <dt>출연</dt>\r\n");
      out.write("          <dd>라이캣,개리씨, 자바독</dd>\r\n");
      out.write("\r\n");
      out.write("        </dl>\r\n");
      out.write("        <div class=\"cont-btn\">\r\n");
      out.write("          <button class=\"btn-ticket\">예매하기</button>\r\n");
      out.write("          <button class=\"btn-teaser\">예고편</button>\r\n");
      out.write("        </div>\r\n");
      out.write("      </li>\r\n");
      out.write("\r\n");
      out.write("    </ul>\r\n");
      out.write("  </div>\r\n");
      out.write("	          </div>\r\n");
      out.write("	     </div>\r\n");
      out.write("	</div>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "common/footer.jsp", out, false);
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
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