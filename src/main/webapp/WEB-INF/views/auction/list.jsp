<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<title>Insert title here</title>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="/static/openvidu/app.js"></script>
<script src="/static/openvidu/webcomp/openvidu-webcomponent-2.24.0.js"></script>
<link rel="stylesheet" href="/static/openvidu/webcomp/openvidu-webcomponent-2.24.0.css">
<c:import url="../common/header.jsp"></c:import>
</head>
<body>
	<main id="main">
	
    
    <div id="vidu" style="text-align: center;">
        <h1>Join a video session</h1>
        <form onsubmit="joinSession(); return false" style="padding: 80px; margin: auto">
            <p>
                <label>Session:</label>
                <input type="text" id="sessionName" value="SessionA" required>
            </p>
            <p>
                <label>User:</label>
                <input type="text" id="user" value="User1" required>
            </p>
            <p>
                <input type="submit" value="JOIN">
            </p>
        </form>
    </div>
	<!-- OpenVidu Web Component -->
	<div>
    	<openvidu-webcomponent style="height : 100%;" id="abc"></openvidu-webcomponent>
    	<ov-videoconference></ov-videoconference>
	</div>
    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="page-header d-flex align-items-center" style="background-image: url('');">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="col-lg-6 text-center">
              <h2>Blog</h2>
              <p>Odio et unde deleniti. Deserunt numquam exercitationem. Officiis quo odio sint voluptas consequatur ut a odio voluptatem. Sit dolorum debitis veritatis natus dolores. Quasi ratione sint. Sit quaerat ipsum dolorem.</p>
            </div>
          </div>
        </div>
      </div>
      <nav>
        <div class="container">
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Blog</li>
          </ol>
        </div>
      </nav>
    </div><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row gy-4 posts-list">

          <div class="col-xl-4 col-md-6">
            <article>

              <div class="post-img">
                <img src="/assets/img/blog/blog-1.jpg" alt="" class="img-fluid">
              </div>

              <p class="post-category">Politics</p>

              <h2 class="title">
                <a href="./detail">Dolorum optio tempore voluptas dignissimos</a>
              </h2>

              <div class="d-flex align-items-center">
                <img src="/assets/img/blog/blog-author.jpg" alt="" class="img-fluid post-author-img flex-shrink-0">
                <div class="post-meta">
                  <p class="post-author-list">Maria Doe</p>
                  <p class="post-date">
                    <time datetime="2022-01-01">Jan 1, 2022</time>
                  </p>
                </div>
              </div>

            </article>
          </div><!-- End post list item -->


        </div><!-- End blog posts list -->

        <div class="blog-pagination">
          <ul class="justify-content-center">
            <li><a href="#">1</a></li>
            <li class="active"><a href="#">2</a></li>
            <li><a href="#">3</a></li>
          </ul>
        </div><!-- End blog pagination -->

      </div>
    </section><!-- End Blog Section -->

  </main><!-- End #main -->
	
	
    

<c:import url="../common/footer.jsp"></c:import>
</body>
</html>