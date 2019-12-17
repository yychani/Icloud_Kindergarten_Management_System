<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   

<style>
.cta-100 {
  
  padding-left: 8%;
  padding-top: 7%;
}
.col-md-4{
    
}
.container{
    margin-left: auto;
    padding-left: 30px;
}

.white {
  color: #fff !important;
}
.mt{float: left;margin-top: -20px;padding-top: 20px;}
.bg-blue-ui {
  background-color: #708198 !important;
}
figure img{width:300px;}

#blogCarousel {
  padding-bottom: 100px;
}

.blog .carousel-indicators {
  left: 0;
  top: -50px;
  height: 50%;
}


/* The colour of the indicators */

.blog .carousel-indicators li {
  background: #708198;
  border-radius: 50%;
  width: 8px;
  height: 8px;
}

.blog .carousel-indicators .active {
  background: #0fc9af;
}




.item-carousel-blog-block {
  outline: medium none;
  padding: 15px;
}

.item-box-blog {
  border: 1px solid #dadada;
  text-align: center;
  
  padding: 20px;
}

.item-box-blog-image {
  position: relative;
}

.item-box-blog-image figure img {
  margin-left:110%;
  width: 100%;
  height: auto;
}

.item-box-blog-date {
  position: absolute;
  z-index: 5;
  padding: 4px 20px;
  top: -20px;
  right: 8px;
  background-color: #41cb52;
}

.item-box-blog-date span {
  color: #fff;
  display: block;
  text-align: center;
  line-height: 1.2;
}

.item-box-blog-date span.mon {
  font-size: 18px;
}

.item-box-blog-date span.day {
  font-size: 16px;
}

.item-box-blog-body {
  padding: 10px;
}

.item-heading-blog a h5 {
  margin: 0;
  line-height: 1;
  text-decoration:none;
  transition: color 0.3s;
}

.item-box-blog-heading a {
    text-decoration: none;
}

.item-box-blog-data p {
  font-size: 13px;
}

.item-box-blog-data p i {
  font-size: 12px;
}

.item-box-blog-text {
  height: 100px;
  overflow: hidden;
}

.mt-10 {
  float: left;
  margin-top: -10px;
  padding-top: 10px;
}

.btn.bg-blue-ui.white.read {
  cursor: pointer;
  padding: 4px 20px;
  float: left;
  margin-top: 10px;
}

.btn.bg-blue-ui.white.read:hover {
  box-shadow: 0px 5px 15px inset #4d5f77;
}
figure {
	
	width:150px;
	height:150px;
}
</style>
</head>
<body>

 <script>
      $(function() {
    	  $(".li:nth-child(9)").addClass("on");
    	  
          $(".topMenuLi:nth-child(2)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(9)").removeClass("on");
            $(".topMenuLi:nth-child(2)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(9)").addClass("on");
            $(".topMenuLi:nth-child(2)").addClass("on");
         });
      }); 
</script>

 <div class="container cta-100 ">
        <div class="container">
          <div class="row blog">
            <div class="col-md-12">
              <div id="blogCarousel" class="carousel slide container-blog" data-ride="carousel">
               
                <!-- Carousel items -->
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <div class="row">
                      <div class="col-md-6" >
                        <div class="item-box-blog">
                          <div class="item-box-blog-image">
                            <!--Date-->
                            <div class="item-box-blog-date bg-blue-ui white"> <span class="mon">Music</span> </div>
                            <!--Image-->
                            <figure> <img src="<%=request.getContextPath() %>/images/as1.png"> </figure>
                          </div>
                          <div class="item-box-blog-body">
                            <!--Heading-->
                            <div class="item-box-blog-heading">
                              
                                <h5>음악프로그램</h5>
                              
                            </div>
                            <!--Data-->
                            <div class="item-box-blog-data" style="padding: px 15px;">
                              <p>music program</p>
                            </div>
                            <!--Text-->
                            <div class="item-box-blog-text">
                              <p>말하기, 노래부르기, 신체표현 악기연주 등 다양한 음악활동을 통해
                                 기초 음악 개념을 형성하고 몸으로 자연스럽게 리듬을 느끼는 음악 프로그램 입니다.</p>
                            </div>
                            
                            <!--Read More Button-->
                          </div>
                        </div>
                      </div>
                      
                      <div class="col-md-6" >
                        <div class="item-box-blog">
                          <div class="item-box-blog-image">
                            <!--Date-->
                            <div class="item-box-blog-date bg-blue-ui white"> <span class="mon">Language</span> </div>
                            <!--Image-->
                            <figure> <img src="<%=request.getContextPath() %>/images/as2.png">  </figure>
                          </div>
                          <div class="item-box-blog-body">
                            <!--Heading-->
                            <div class="item-box-blog-heading">
                              
                                <h5>다양한 언어 프로그램</h5>
                              
                            </div>
                            <!--Data-->
                            <div class="item-box-blog-data" style="padding: px 15px;">
                              <p>various language program</p>
                            </div>
                            <!--Text-->
                            <div class="item-box-blog-text">
                              <p>언어 습득의 기본단계와 유아의 특성을 반영 하여 알파벳 모양을 흥미롭게 익히며 기초과정을 완성하고
                                다양한 언어를 처음 접하는 유아들이 즐겁게 배울 수 있도록 하는 프로그램</p>
                            </div>
                            
                            <!--Read More Button-->
                          </div>
                        </div>
                      </div>
                      <!--여기부터 밑으로 내려가게 하고싶은데.....-->
                      <div class="col-md-6" >
                        <div class="item-box-blog">
                          <div class="item-box-blog-image">
                            <!--Date-->
                            <div class="item-box-blog-date bg-blue-ui white"> <span class="mon">Play</span> </div>
                            <!--Image-->
                            <figure><img src="<%=request.getContextPath() %>/images/as3.png">  </figure>
                          </div>
                          <div class="item-box-blog-body">
                            <!--Heading-->
                            <div class="item-box-blog-heading">
                             
                                <h5>놀이 프로그램</h5>
                              
                            </div>
                            <!--Data-->
                            <div class="item-box-blog-data" style="padding: px 15px;">
                              <p>play program</p>
                            </div>
                            <!--Text-->
                            <div class="item-box-blog-text">
                              <p>
                                다양한 신체단련활동을 통해 성장 발달에 도움이 되는 놀이 프로그램을 통해
                            근육발달과 지구력을 키울수 있는 활동</p>
                            </div>
                            
                            <!--Read More Button-->
                          </div>
                        </div>
                      </div>
                      
                          <div class="col-md-6" >
                            <div class="item-box-blog">
                              <div class="item-box-blog-image">
                                <!--Date-->
                                <div class="item-box-blog-date bg-blue-ui white"> <span class="mon">Art</span> </div>
                                <!--Image-->
                                <figure> <img src="<%=request.getContextPath() %>/images/as4.png">  </figure>
                              </div>
                              <div class="item-box-blog-body">
                                <!--Heading-->
                                <div class="item-box-blog-heading">
                                  
                                    <h5>예술 프로그램</h5>
                                  
                                </div>
                                <!--Data-->
                                <div class="item-box-blog-data" style="padding: px 15px;">
                                  <p>arts program</p>
                                </div>
                                <!--Text-->
                                <div class="item-box-blog-text">
                                  <p>만들고 그리며 노는 과정에서 아이의 마음이 가장 자유롭게 펼쳐지도록 창의표현, 생각을 이끌어 내는
                                    아이들의 이야기 미술 프로그램</p>
                                </div>
                                
                                <!--Read More Button-->
                              </div>
                            
                    </div>
                    
                    <!--.row-->
                  </div>
                  <!--.item-->
                 
                      
                    <!--.row-->
                  </div>
                  <!--.item-->
                </div>
                <!--.carousel-inner-->
              </div>
              <!--.Carousel-->
            </div>
          </div>
        </div>
      </div>
     <script>
     
 	$(function() {
	    $(".li1").addClass("on");
	    $(".topMenuLi:nth-child(3)").addClass("on");

	    $(".topMenuLi").mouseover(function() {
	       $(".li1").removeClass("on");
	       $(".topMenuLi:nth-child(3)").removeClass("on");
	    });
	    $(".topMenuLi").mouseleave(function() {
	       $(".li1").addClass("on");
	       $(".topMenuLi:nth-child(3)").addClass("on");
	    });

	 }); 
     
     
     
     
     
     </script>
</body>
</html>