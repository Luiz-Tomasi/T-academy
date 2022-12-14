/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: jetty/9.4.5.v20170502
 * Generated at: 2022-11-03 17:21:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.blog.entidades.Usuario;
import com.blog.dao.DaoUsuario;
import com.blog.entidades.Postagem;
import com.blog.dao.DaoPostagem;
import com.blog.dao.DaoComentario;
import com.blog.entidades.Comentario;
import java.util.List;

public final class LoginCadastro_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("com.blog.entidades.Postagem");
    _jspx_imports_classes.add("com.blog.entidades.Comentario");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.blog.dao.DaoPostagem");
    _jspx_imports_classes.add("com.blog.dao.DaoComentario");
    _jspx_imports_classes.add("com.blog.entidades.Usuario");
    _jspx_imports_classes.add("com.blog.dao.DaoUsuario");
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

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"pt-br\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, shrink-to-fit=no\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Bootstrap Css import -->\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/styleLoginCadastro/style.css\">\r\n");
      out.write("    <script src=\"assets/index.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <title>Login Page</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"loginArea\">\r\n");
      out.write("            <div class=\"row mt-5\">\r\n");
      out.write("                <div id=\"signIn\" class=\"col d-flex justify-content-center\">Sign in</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <form action=\"LoginCadastro.jsp\">\r\n");
      out.write("                <div class=\"row mt-2 justify-content-md-center\">\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"E-mail\" name=\"email\" id = \"e-mail\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"row mt-2 justify-content-md-center\">\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <input type=\"password\" class=\"form-control\" placeholder=\"Password\" name=\"senha\" id = \"senha\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"row mt-2 justify-content-md-center\"></div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                    <button  class=\"form-control bg-primary\" id=\"submitLogin\" onclick=\"\">Logar</button>\r\n");
      out.write("                </div>\r\n");
      out.write("            </form>\r\n");
      out.write("                <button type=\"button\" class=\"bg-primary\" id=\"cadastrar\">Cadastrar</button>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    ");

        String emailAtual = request.getParameter("email");
        String senhaAtual = request.getParameter("senha");
        Usuario usuarioAtual = DaoUsuario.autenticarLogin(emailAtual, senhaAtual);
        if(emailAtual != null){
            if(emailAtual.equals(usuarioAtual.getEmail()) && senhaAtual.equals(usuarioAtual.getSenha())){
                        out.write("<script>sessionStorage.setItem('email', '"+emailAtual+"')</script>");
                        out.write("<script>sessionStorage.setItem('senha', '"+senhaAtual+"')</script>");
                        out.write("<script>sessionStorage.setItem('Moderador', '"+usuarioAtual.getModerador()+"')</script>");
                        out.write("<script> trocarPag() </script>");
            }
        }
    
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    <!-- Toastify-js notifications -->\r\n");
      out.write("    <script type=\"text/javascript\" src=\"https://cdn.jsdelivr.net/npm/toastify-js\"></script>\r\n");
      out.write("    <!-- Bootstrap JavaScript dependences -->\r\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\" integrity=\"sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\r\n");
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
