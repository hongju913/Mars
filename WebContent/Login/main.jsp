<%@page import="com.KHJ.member.memberDAO"%>
<%@page import="com.KHJ.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Mars. Home</title>

<!--

Breezed Template

https://templatemo.com/tm-543-breezed

-->
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="../temp/assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="../temp/assets/css/font-awesome.css">

    <link rel="stylesheet" href="../temp/assets/css/templatemo-breezed.css">

    <link rel="stylesheet" href="../temp/assets/css/owl-carousel.css">

    <link rel="stylesheet" href="../temp/assets/css/lightbox.css">

    </head>
    
    <body>
    
    <%
	//사용자 정보 가져와서 로그인 했을때 이동되는 페이지
	//로그인 안했으면 로그인 페이지로 이동하기
	
	String id = (String)session.getAttribute("id");

	if(id == null){
		System.out.println("로그인 페이지로 이동합니다.");
		response.sendRedirect("LoginForm.jsp");
	}
	memberDAO mdao = new memberDAO();
	MemberBean mb = mdao.getMemberUpdate(id);
%>
    
    
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    
    
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="main.jsp" class="logo">
                           .Mars
                        </a>
                        <!-- ***** Logo End ***** -->

                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->
  
    <!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner header-text" id="top">
        <div class="Modern-Slider">
         <!-- Item -->
          <div class="item">
            <div class="img-fill">
                <img src="../temp/assets/images/slide-03.jpg" alt="">
                <div class="text-content">
                  <h3><b><%=mb.getName() %></b>님 환영합니다. </h3>
                  <a href="#" class="main-stroked-button"
                  	 onclick="location.href='memberInfo.jsp'">Info</a>
                  <a href="#" class="main-filled-button"
                    onclick="location.href='updateForm.jsp'">update Info</a>
                    <a href="#" class="main-stroked-button"
                  	onclick="location.href='logoutPro.jsp'">Logout</a>

                    
                </div>
            </div>
          </div>
          <!-- // Item -->
          <!-- Item -->
          <div class="item">
            <div class="img-fill">
                <img src="../temp/assets/images/slide-02.jpg" alt="">
                <div class="text-content">
                  <h5>STAR's Board</h5>
                  <a href="#" class="main-stroked-button">Members only</a>
                  <a href="#" class="main-filled-button"
                  	onclick="location.href='../FileBoard/boardList.jsp'">click!!</a>
                </div>
            </div>
          </div>
          <!-- // Item -->
          <!-- Item -->
          <div class="item">
            <div class="img-fill">
                <img src="../temp/assets/images/slide-01.jpg" alt="">
                <div class="text-content">
                  <h5>For fan's board story</h5>
                  <a href="#" class="main-stroked-button">File board</a>
                  <a href="#" class="main-filled-button"
                  	onclick="location.href='../Board/boardList.jsp'">click!!</a>
                </div>
            </div>
          </div>
          <!-- // Item -->
        </div>
    </div>
    <div class="scroll-down scroll-to-section"><a href="#about"><i class="fa fa-arrow-down"></i></a></div>
    <!-- ***** Main Banner Area End ***** -->

       
    <!-- ***** Testimonials Starts ***** -->
    <section class="section" id="testimonials">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h6>Line up</h6>
                        <h2>Stars with MARS</h2>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 mobile-bottom-fix-big" data-scroll-reveal="enter left move 30px over 0.6s after 0.4s">
                    <div class="owl-carousel owl-theme">
                        <div class="item author-item">
                            <div class="member-thumb">
                                <img src="../img/TheBoyz.jpg" alt="">
                                <div class="hover-effect">
                                    <div class="hover-content">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-facebook"
                                            	onclick="location.href='https://ko-kr.facebook.com/officialTHEBOYZ'"></i></a></li>
                                            <li><a href="#"><i class="fa fa-twitter"
                                            	onclick="location.href='https://twitter.com/Creker_THEBOYZ'"></i></a></li>
                                            <li><a href="#"><i class="fa fa-linkedin"
                                            	onclick="location.href='https://cafe.daum.net/officialTHEBOYZ'"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <h4>THE BOYZ</h4>
                        </div>
                        <div class="item author-item">
                            <div class="member-thumb">
                                <img src="../img/astro.jpg
                                " alt="">
                                <div class="hover-effect">
                                    <div class="hover-content">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-facebook"
                                            	onclick="location.href='https://ko-kr.facebook.com/offclASTRO'"></i></a></li>
                                            <li><a href="#"><i class="fa fa-twitter"
                                            	onclick="location.href='https://twitter.com/offclASTRO'"></i></a></li>
                                            <li><a href="#"><i class="fa fa-linkedin"
                                            	onclick="location.href='https://cafe.daum.net/fantagio-boys'"></i></a></li>
                                          
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <h4>ASTRO</h4>
                        </div>
                        <div class="item author-item">
                            <div class="member-thumb">
                                <img src="../img/wjsn.jpg" alt="">
                                <div class="hover-effect">
                                    <div class="hover-content">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-facebook"
                                            	onclick="location.href='https://www.facebook.com/officialcosmicgirls'"></i></a></li>
                                            <li><a href="#"><i class="fa fa-twitter"
                                            	onclick="location.href='https://twitter.com/WJSN_Cosmic?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor'"></i></a></li>
                                            <li><a href="#"><i class="fa fa-linkedin"
                                            	onclick="location.href='https://cafe.daum.net/WJSNcosmic'"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <h4>WJSN</h4>
                        </div>
                       
                      
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Testimonials Ends ***** -->

    <!-- ***** Features Big Item Start ***** -->
    <section class="section" id="features">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12" data-scroll-reveal="enter left move 30px over 0.6s after 0.4s">
                    <div class="features-item">
                        <div class="features-icon">
                            <img src="../temp/assets/images/features-icon-1.png" alt="">
                        </div>
                        <div class="features-content">
                            <h4>Members Only file Board</h4>
                            <p>스타들과 소통할 수 있는 멤버쉽 전용 게시판입니다. 아티스트와 함께 나누는 오늘의 일상, 새로운 소식을 누구보다 빠르게 확인하고 소통해보세요!</p>
                            <a href="#" class="text-button-icon"
                            onclick="location.href='../FileBoard/boardList.jsp'">
                                get to click!! <i class="fa fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12" data-scroll-reveal="enter bottom move 30px over 0.6s after 0.4s">
                    <div class="features-item">
                        <div class="features-icon">
                            <img src="../temp/assets/images/features-icon-1.png" alt="">
                        </div>
                        <div class="features-content">
                            <h4>Members Only Board</h4>
                            <p>마스에서 제공하는 스타들의 사진과 콘텐츠를 다운로드 할 수 있는 게시판입니다. 매일 업데이트 되는 새로운 컨텐츠들을 만나보세요!</p>
                            <a href="#" class="text-button-icon"
                            onclick="location.href='../Board/boardList.jsp'">
                                get to click!! <i class="fa fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
              </div>
            </div>
    </section>
    <!-- ***** Features Big Item End ***** -->

	<!-- ***** 메일보내기 ***** -->
	
		<jsp:include page="../mail/mailform.jsp"/>
	
	<!-- ***** 메일보내기 ***** -->

    <!-- ***** Footer Start ***** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-xs-12">
                    <div class="left-text-content">
                        <p>Copyright &copy; 2021 .MARS Co., Ltd. 
                        
                        - Design: <a rel="nofollow noopener" href="https://templatemo.com">TemplateMo</a></p>
                    </div>
                </div>
                <div class="col-lg-6 col-xs-12">
                    <div class="right-text-content">
                            <ul class="social-icons">
                                <li><p>Follow Us</p></li>
                                <li><a rel="nofollow" href="https://fb.com/templatemo"><i class="fa fa-facebook"></i></a></li>
                                <li><a rel="nofollow" href="https://fb.com/templatemo"><i class="fa fa-twitter"></i></a></li>
                                <li><a rel="nofollow" href="https://fb.com/templatemo"><i class="fa fa-linkedin"></i></a></li>
                                <li><a rel="nofollow" href="https://fb.com/templatemo"><i class="fa fa-dribbble"></i></a></li>
                            </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    

    <!-- jQuery -->
    <script src="../temp/assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="../temp/assets/js/popper.js"></script>
    <script src="../temp/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="../temp/assets/js/owl-carousel.js"></script>
    <script src="../temp/assets/js/scrollreveal.min.js"></script>
    <script src="../temp/assets/js/waypoints.min.js"></script>
    <script src="../temp/assets/js/jquery.counterup.min.js"></script>
    <script src="../temp/assets/js/imgfix.min.js"></script> 
    <script src="../temp/assets/js/slick.js"></script> 
    <script src="../temp/assets/js/lightbox.js"></script> 
    <script src="../temp/assets/js/isotope.js"></script> 
    
    <!-- Global Init -->
    <script src="../temp/assets/js/custom.js"></script>

    <script>

        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });

    </script>

  </body>
</html>