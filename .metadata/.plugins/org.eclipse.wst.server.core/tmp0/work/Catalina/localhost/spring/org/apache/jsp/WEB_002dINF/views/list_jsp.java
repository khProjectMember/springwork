/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.70
 * Generated at: 2023-01-07 20:45:11 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "common/header.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div id=\"wrap\">\r\n");
      out.write("        <div id=\"banner\">\r\n");
      out.write("            <div class=\"inner\">\r\n");
      out.write("                <div class=\"banner\">\r\n");
      out.write("                    <div class=\"swiper\">\r\n");
      out.write("                        <!-- Additional required wrapper -->\r\n");
      out.write("                        <div class=\"swiper-wrapper\">\r\n");
      out.write("                          <!-- Slides -->\r\n");
      out.write("                          <div class=\"swiper-slide\">\r\n");
      out.write("                            <div class=\"backg\" onclick=\"location.href='#'\">                        \r\n");
      out.write("                                <img src=\"resources/img/swim.jpg\" alt=\"수영\">\r\n");
      out.write("                                <div class=\"explan\">\r\n");
      out.write("                                    <p>수강신청 안내</p>\r\n");
      out.write("                                    <div class=\"edate\">\r\n");
      out.write("                                        <p>강좌기간</p>\r\n");
      out.write("                                        <span>2023.01.01~2023.12.31</span>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"edate\">\r\n");
      out.write("                                        <p>접수기간</p>\r\n");
      out.write("                                        <span>2023.01.01~2023.12.31</span>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"edate\">\r\n");
      out.write("                                        <p>접수방법</p>\r\n");
      out.write("                                        <span>홈페이지 접수 또는 방문 접수</span>\r\n");
      out.write("                                    </div>                            \r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div> \r\n");
      out.write("                          </div>\r\n");
      out.write("                          <div class=\"swiper-slide\">\r\n");
      out.write("                            <div class=\"backg\" onclick=\"location.href='#'\">                        \r\n");
      out.write("                                <img src=\"resources/img/swim.jpg\" alt=\"수영\">\r\n");
      out.write("                                <div class=\"explan\">\r\n");
      out.write("                                    <p>수강신청 안내</p>\r\n");
      out.write("                                    <div class=\"edate\">\r\n");
      out.write("                                        <p>강좌기간</p>\r\n");
      out.write("                                        <span>2023.01.01~2023.12.31</span>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"edate\">\r\n");
      out.write("                                        <p>접수기간</p>\r\n");
      out.write("                                        <span>2023.01.01~2023.12.31</span>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"edate\">\r\n");
      out.write("                                        <p>접수방법</p>\r\n");
      out.write("                                        <span>홈페이지 접수 또는 방문 접수</span>\r\n");
      out.write("                                    </div>                            \r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div> \r\n");
      out.write("                          </div>\r\n");
      out.write("                          <div class=\"swiper-slide\">\r\n");
      out.write("                            <div class=\"backg\" onclick=\"location.href='#'\">                        \r\n");
      out.write("                                <img src=\"resources/img/swim.jpg\" alt=\"수영\">\r\n");
      out.write("                                <div class=\"explan\">\r\n");
      out.write("                                    <p>수강신청 안내</p>\r\n");
      out.write("                                    <div class=\"edate\">\r\n");
      out.write("                                        <p>강좌기간</p>\r\n");
      out.write("                                        <span>2023.01.01~2023.12.31</span>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"edate\">\r\n");
      out.write("                                        <p>접수기간</p>\r\n");
      out.write("                                        <span>2023.01.01~2023.12.31</span>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"edate\">\r\n");
      out.write("                                        <p>접수방법</p>\r\n");
      out.write("                                        <span>홈페이지 접수 또는 방문 접수</span>\r\n");
      out.write("                                    </div>                            \r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div> \r\n");
      out.write("                          </div>\r\n");
      out.write("                          \r\n");
      out.write("                        </div>\r\n");
      out.write("                        <!-- If we need pagination -->\r\n");
      out.write("                        <div class=\"swiper-pagination\"></div>\r\n");
      out.write("                      \r\n");
      out.write("                        <!-- If we need navigation buttons -->\r\n");
      out.write("                        <div class=\"swiper-button-prev\"></div>\r\n");
      out.write("                        <div class=\"swiper-button-next\"></div>\r\n");
      out.write("                      </div>                                          \r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div id=\"wrap\">\r\n");
      out.write("        <div id=\"content\">\r\n");
      out.write("            <div class=\"inner\">\r\n");
      out.write("                <div class=\"content\">\r\n");
      out.write("                    <h2>추천강좌</h2>\r\n");
      out.write("                    <div class=\"container\">\r\n");
      out.write("                        <div class=\"reco\">\r\n");
      out.write("                            <ul class=\"reco_ul\">\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"#\" class=\"over_mouse\">\r\n");
      out.write("                                        <div class=\"img_box\">\r\n");
      out.write("                                            <img src=\"resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg\" alt=\"라떼아트\">\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_info\">\r\n");
      out.write("                                            <div class=\"info_detail\">\r\n");
      out.write("                                                <span>라떼아트 기초반</span>\r\n");
      out.write("                                                <p>강사 : 고석우 강사</p>\r\n");
      out.write("                                                <p>월, 수, 금 18:00~20:00</p>\r\n");
      out.write("                                                <p>월 30,000원</p>\r\n");
      out.write("                                            </div>                                            \r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_title\">\r\n");
      out.write("                                            <p><바리스타 초급반></p>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"#\" class=\"over_mouse\">\r\n");
      out.write("                                        <div class=\"img_box\">\r\n");
      out.write("                                            <img src=\"resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg\" alt=\"라떼아트\">\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_info\">\r\n");
      out.write("                                            <div class=\"info_detail\">\r\n");
      out.write("                                                <span>라떼아트 기초반</span>\r\n");
      out.write("                                                <p>강사 : 고석우 강사</p>\r\n");
      out.write("                                                <p>월, 수, 금 18:00~20:00</p>\r\n");
      out.write("                                                <p>월 30,000원</p>\r\n");
      out.write("                                            </div>        \r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_title\">\r\n");
      out.write("                                            <p><바리스타 초급반></p>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"#\" class=\"over_mouse\">\r\n");
      out.write("                                        <div class=\"img_box\">\r\n");
      out.write("                                            <img src=\"resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg\" alt=\"라떼아트\">\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_info\">\r\n");
      out.write("                                            <div class=\"info_detail\">\r\n");
      out.write("                                                <span>라떼아트 기초반</span>\r\n");
      out.write("                                                <p>강사 : 고석우 강사</p>\r\n");
      out.write("                                                <p>월, 수, 금 18:00~20:00</p>\r\n");
      out.write("                                                <p>월 30,000원</p>\r\n");
      out.write("                                            </div>        \r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_title\">\r\n");
      out.write("                                            <p><바리스타 초급반></p>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"#\" class=\"over_mouse\">\r\n");
      out.write("                                        <div class=\"img_box\">\r\n");
      out.write("                                            <img src=\"resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg\" alt=\"라떼아트\">\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_info\">\r\n");
      out.write("                                            <div class=\"info_detail\">\r\n");
      out.write("                                                <span>라떼아트 기초반</span>\r\n");
      out.write("                                                <p>강사 : 고석우 강사</p>\r\n");
      out.write("                                                <p>월, 수, 금 18:00~20:00</p>\r\n");
      out.write("                                                <p>월 30,000원</p>\r\n");
      out.write("                                            </div>        \r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_title\">\r\n");
      out.write("                                            <p><바리스타 초급반></p>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"#\" class=\"over_mouse\">\r\n");
      out.write("                                        <div class=\"img_box\">\r\n");
      out.write("                                            <img src=\"resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg\" alt=\"라떼아트\">\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_info\">\r\n");
      out.write("                                            <div class=\"info_detail\">\r\n");
      out.write("                                                <span>라떼아트 기초반</span>\r\n");
      out.write("                                                <p>강사 : 고석우 강사</p>\r\n");
      out.write("                                                <p>월, 수, 금 18:00~20:00</p>\r\n");
      out.write("                                                <p>월 30,000원</p>\r\n");
      out.write("                                            </div>        \r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_title\">\r\n");
      out.write("                                            <p><바리스타 초급반></p>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>                          \r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"content2\">\r\n");
      out.write("                    <h2>최신강좌</h2>\r\n");
      out.write("                    <div class=\"container\">\r\n");
      out.write("                        <div class=\"reco\">\r\n");
      out.write("                            <ul class=\"reco_ul\">\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"#\" class=\"over_mouse\">\r\n");
      out.write("                                        <div class=\"img_box\">\r\n");
      out.write("                                            <img src=\"resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg\" alt=\"라떼아트\">\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_info\">\r\n");
      out.write("                                            <div class=\"info_detail\">\r\n");
      out.write("                                                <span>라떼아트 기초반</span>\r\n");
      out.write("                                                <p>강사 : 고석우 강사</p>\r\n");
      out.write("                                                <p>월, 수, 금 18:00~20:00</p>\r\n");
      out.write("                                                <p>월 30,000원</p>\r\n");
      out.write("                                            </div>                                            \r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_title\">\r\n");
      out.write("                                            <p><바리스타 초급반></p>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"#\" class=\"over_mouse\">\r\n");
      out.write("                                        <div class=\"img_box\">\r\n");
      out.write("                                            <img src=\"resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg\" alt=\"라떼아트\">\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_info\">\r\n");
      out.write("                                            <div class=\"info_detail\">\r\n");
      out.write("                                                <span>라떼아트 기초반</span>\r\n");
      out.write("                                                <p>강사 : 고석우 강사</p>\r\n");
      out.write("                                                <p>월, 수, 금 18:00~20:00</p>\r\n");
      out.write("                                                <p>월 30,000원</p>\r\n");
      out.write("                                            </div>        \r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_title\">\r\n");
      out.write("                                            <p><바리스타 초급반></p>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"#\" class=\"over_mouse\">\r\n");
      out.write("                                        <div class=\"img_box\">\r\n");
      out.write("                                            <img src=\"resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg\" alt=\"라떼아트\">\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_info\">\r\n");
      out.write("                                            <div class=\"info_detail\">\r\n");
      out.write("                                                <span>라떼아트 기초반</span>\r\n");
      out.write("                                                <p>강사 : 고석우 강사</p>\r\n");
      out.write("                                                <p>월, 수, 금 18:00~20:00</p>\r\n");
      out.write("                                                <p>월 30,000원</p>\r\n");
      out.write("                                            </div>        \r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_title\">\r\n");
      out.write("                                            <p><바리스타 초급반></p>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"#\" class=\"over_mouse\">\r\n");
      out.write("                                        <div class=\"img_box\">\r\n");
      out.write("                                            <img src=\"resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg\" alt=\"라떼아트\">\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_info\">\r\n");
      out.write("                                            <div class=\"info_detail\">\r\n");
      out.write("                                                <span>라떼아트 기초반</span>\r\n");
      out.write("                                                <p>강사 : 고석우 강사</p>\r\n");
      out.write("                                                <p>월, 수, 금 18:00~20:00</p>\r\n");
      out.write("                                                <p>월 30,000원</p>\r\n");
      out.write("                                            </div>        \r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_title\">\r\n");
      out.write("                                            <p><바리스타 초급반></p>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"#\" class=\"over_mouse\">\r\n");
      out.write("                                        <div class=\"img_box\">\r\n");
      out.write("                                            <img src=\"resources/img/hands-filling-a-cup-of-coffee-with-milk.jpg\" alt=\"라떼아트\">\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_info\">\r\n");
      out.write("                                            <div class=\"info_detail\">\r\n");
      out.write("                                                <span>라떼아트 기초반</span>\r\n");
      out.write("                                                <p>강사 : 고석우 강사</p>\r\n");
      out.write("                                                <p>월, 수, 금 18:00~20:00</p>\r\n");
      out.write("                                                <p>월 30,000원</p>\r\n");
      out.write("                                            </div>        \r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"img_title\">\r\n");
      out.write("                                            <p><바리스타 초급반></p>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>                          \r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"content3\">\r\n");
      out.write("                    <div class=\"notice\">\r\n");
      out.write("                        <h2>공지사항</h2>\r\n");
      out.write("                        <div class=\"notice_box\">\r\n");
      out.write("                            <div class=\"notice_title\">\r\n");
      out.write("                                <ul>\r\n");
      out.write("                                    <li><a href=\"#\">제목</a></li>\r\n");
      out.write("                                    <li><a href=\"#\">제목</a></li>\r\n");
      out.write("                                    <li><a href=\"#\">제목</a></li>\r\n");
      out.write("                                    <li><a href=\"#\">제목</a></li>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"notice_date\">\r\n");
      out.write("                                <ul>\r\n");
      out.write("                                    <li>2023-01-01</li>\r\n");
      out.write("                                    <li>2023-01-01</li>\r\n");
      out.write("                                    <li>2023-01-01</li>\r\n");
      out.write("                                    <li>2023-01-01</li>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"event\">\r\n");
      out.write("                        <h2>이벤트</h2>\r\n");
      out.write("                        <div class=\"event_box\">\r\n");
      out.write("                            <div class=\"event_title\">\r\n");
      out.write("                                <ul>\r\n");
      out.write("                                    <li><a href=\"#\">제목</a></li>\r\n");
      out.write("                                    <li><a href=\"#\">제목</a></li>\r\n");
      out.write("                                    <li><a href=\"#\">제목</a></li>\r\n");
      out.write("                                    <li><a href=\"#\">제목</a></li>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"event_date\">\r\n");
      out.write("                                <ul>\r\n");
      out.write("                                    <li>2023-01-01</li>\r\n");
      out.write("                                    <li>2023-01-01</li>\r\n");
      out.write("                                    <li>2023-01-01</li>\r\n");
      out.write("                                    <li>2023-01-01</li>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"quickmenu\">\r\n");
      out.write("                <ul>\r\n");
      out.write("                    <li><a href=\"\">문의</a></li>\r\n");
      out.write("                    <li><a href=\"#\"><img src=\"resources/img/icons8-쪽으로-48.png\" alt=\"화살표 위로\"></a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("	\r\n");
      out.write("	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "common/footer.jsp", out, false);
      out.write("\r\n");
      out.write("	<div class=\"all\"></div>\r\n");
      out.write("    <script>\r\n");
      out.write("        // 검색 버튼 fade\r\n");
      out.write("        $(function() {\r\n");
      out.write("            $('.main_btn').on('click', function(e) {\r\n");
      out.write("                $('.h_form').fadeIn(300)\r\n");
      out.write("                \r\n");
      out.write("                $('.search_cancle').on('click', function() {\r\n");
      out.write("                    $('.h_form').fadeOut(300)\r\n");
      out.write("                })\r\n");
      out.write("            })\r\n");
      out.write("        })\r\n");
      out.write("\r\n");
      out.write("        // 강좌 이미지 설명 hover\r\n");
      out.write("        $(function() {\r\n");
      out.write("            $('.over_mouse').mouseover(function() {\r\n");
      out.write("                $(this).find('.img_info').stop().fadeIn(400);\r\n");
      out.write("            }).mouseleave(function() {\r\n");
      out.write("                $(this).find('.img_info').stop().fadeOut(400);\r\n");
      out.write("            })\r\n");
      out.write("        })\r\n");
      out.write("\r\n");
      out.write("        // 헤더 카데고리 바 숨겨진 div\r\n");
      out.write("        $(function() {\r\n");
      out.write("            $('.nav_category').mouseover(function() {\r\n");
      out.write("                $('.nav_bar').stop().fadeIn(1);\r\n");
      out.write("            })\r\n");
      out.write("            $($('.nav_bar')).mouseleave(function() {\r\n");
      out.write("                $(this).fadeOut(1);\r\n");
      out.write("            })\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("        })\r\n");
      out.write("\r\n");
      out.write("        $(window).scroll(function( ){  //스크롤이 움직일때마다 이벤트 발생 \r\n");
      out.write("            \r\n");
      out.write("            var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.\r\n");
      out.write("            if(position < 1500) {\r\n");
      out.write("                $('.quickmenu').stop().animate({top:position+\"px\"}, 1000); //해당 오브젝트 위치값 재설정\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("            \r\n");
      out.write("        const swiper = new Swiper('.swiper', {\r\n");
      out.write("            \r\n");
      out.write("            loop: true,\r\n");
      out.write("            // speed: 10000,\r\n");
      out.write("            // loopedSlides: 5,\r\n");
      out.write("            // observer:true,\r\n");
      out.write("            // observeParents:true,\r\n");
      out.write("\r\n");
      out.write("            // If we need pagination\r\n");
      out.write("            pagination: {\r\n");
      out.write("                el: '.swiper-pagination',\r\n");
      out.write("                clickable: true,\r\n");
      out.write("            },\r\n");
      out.write("            \r\n");
      out.write("            // Navigation arrows\r\n");
      out.write("            navigation: {\r\n");
      out.write("                nextEl: '.swiper-button-next',\r\n");
      out.write("                prevEl: '.swiper-button-prev',\r\n");
      out.write("            },\r\n");
      out.write("\r\n");
      out.write("            autoplay: {\r\n");
      out.write("                delay: 3000,\r\n");
      out.write("                // stopOnLastSlide: false,\r\n");
      out.write("                // disableOnInteraction: true,\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            // freeMode: {\r\n");
      out.write("            //     enabled: true,\r\n");
      out.write("            //     sticky: true,\r\n");
      out.write("            // },\r\n");
      out.write("\r\n");
      out.write("        });\r\n");
      out.write("          \r\n");
      out.write("    </script>\r\n");
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
