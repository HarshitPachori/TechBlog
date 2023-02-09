<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<div class="row">
    <%
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));

        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPost();
        } else {
            posts = d.getAllPostByCatId(cid);
        }
        if (posts.size() == 0) {
            out.println("<h2 class='display-3 text-center'>No post in this category...</h2>");
            return;
        }
        for (Post p : posts) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img src="blog_pics/<%=p.getpPic()%>" class="card-img-top" alt="...">
            <div class="card-body">
                <b><%=p.getpTitle()%></b>
                <p><%=p.getpContent()%></p>                
            </div>
            <div class="card-footer primary-background text-center ">
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>