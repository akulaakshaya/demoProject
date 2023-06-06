<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>SLAM Store</title>
 <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
    jQuery(document).ready(function($) {
      function loadCategories() {
        $.ajax({
          url: "CategoriesServlet",
          method: 'GET',
          success: function(response) {
            $('#catg').html(response);
          },
          error: function(xhr, status, error) {
            console.log('AJAX Error: ' + error);
          }
        });
      }

      loadCategories(); // Call the loadCategories function when the page loads

      $('#catg').change(function() {
        var category = $("#catg").val();
        $.ajax({
          url: "products",
          method: 'GET',
          data: { category: category },
          success: function(response) {
            $('#transitionSlideShowPage').html(response);
          },
          error: function(xhr, status, error) {
            console.log('AJAX Error: ' + error);
          }
        });
      });

      var slides = $('.slide');
      var currentSlide = 0;

      // Function to show the current slide
      function showSlide() {
        // Hide all slides
        slides.hide();

        // Show the current slide
        slides.eq(currentSlide).show();
      }

      // Function to move to the next slide
      function nextSlide() {
        currentSlide++;
        if (currentSlide >= slides.length) {
          currentSlide = 0;
        }
        showSlide();
      }

      // Start the slideshow
      setInterval(nextSlide, 3000); // Change slide every 3 seconds
    });
  </script>
<!--   <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    
    header {
      background-color: #333;
      color: #fff;
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    nav ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      display: flex;
    }
    
    nav ul li {
      display: inline;
      margin-right: 10px;
    }
    
    nav ul li a {
      color: #fff;
      text-decoration: none;
      padding: 10px 20px;
    }
    
    nav ul li a:hover {
      background-color: #555;
    }
    
    .search-bar {
      text-align: center;
      padding: 20px;
      background-color: #f2f2f2;
    }
    
    .product-list {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
    }
    
    .product-card {
      width: 250px;
      margin: 20px;
      border: 1px solid #ddd;
      border-radius: 4px;
      padding: 10px;
      text-align: center;
    }
    
    .product-card img {
      width: 100%;
      max-height: 200px;
      object-fit: cover;
      margin-bottom: 10px;
    }
    
    .product-card h3 {
      margin: 10px 0;
    }
    
    .slide {
      display: none;
    }
    
    .slide.active {
      display: block;
    }
    
    /* Modified dropdown style */
    .dropdown-menu {
      background-color: #fff;
      border: none;
      box-shadow: 0px 0px 6px 0px rgba(0,0,0,0.2);
      padding: 10px;
    }
    
    .dropdown-menu a {
      color: #333;
      text-decoration: none;
      display: block;
      padding: 8px 16px;
      transition: background-color 0.3s;
    }
    
    .dropdown-menu a:hover {
      background-color: #f2f2f2;
    }
  </style> -->
  
  
  
  <!-- second styling -->
<!-- <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    
    header {
      background-color: #333;
      color: #fff;
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    nav ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      display: flex;
    }
    
    nav ul li {
      display: inline;
      margin-right: 10px;
    }
    
    nav ul li a {
      color: #fff;
      text-decoration: none;
      padding: 10px 20px;
    }
    
    nav ul li a:hover {
      background-color: #555;
    }
    
    .search-bar {
      text-align: center;
      padding: 20px;
      background-color: #f2f2f2;
    }
    
    .product-list {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
    }
    
    .product-card {
      width: 250px;
      margin: 20px;
      border: 1px solid #ddd;
      border-radius: 4px;
      padding: 10px;
      text-align: center;
    }
    
    .product-card img {
      width: 100%;
      max-height: 200px;
      object-fit: cover;
      margin-bottom: 10px;
    }
    
    .product-card h3 {
      margin: 10px 0;
    }
    
    .slide {
      display: none;
    }
    
    .slide.active {
      display: block;
    }
  </style>
 -->
 
   <style>
   
   
   
    .dropdown-content1 {
 
 
  right: 0;
  left: auto;
  max-width: 400px;
}
    

@media (max-width: 600px) {
  .dropdown-content1 {
    right: auto;
    left: 0;
    max-width: 100%;
  }
}


    
.profile-options {
  list-style: none;
  padding: 0;
  margin: 20px 0;
}

.profile-options li {
  margin-bottom: 10px;
}

.profile-options a {
  display: block;
  padding: 10px 20px;
  background-color: #f2f2f2;
  color: #333;
  text-decoration: none;
  transition: background-color 0.3s ease;
}

.profile-options a:hover {
  background-color: #ddd;
}

.modal-body {
  height: 300px; /* Increase or adjust the height as needed */
  overflow-y: auto;
}

.modal-content {
  width: 500px; /* Increase or adjust the width as needed */
}
    
    
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    
    header {
      background-color: #333;
      color: #fff;
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    nav ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
    }
    
    nav ul li {
      display: inline;
    }
    
    nav ul li a {
      color: #fff;
      text-decoration: none;
      padding: 10px 20px;
    }
    
    nav ul li a:hover {
      background-color: #555;
    }
    
    .search-bar {
      text-align: center;
      padding: 20px;
      background-color: #f2f2f2;
    }
    
    .search-bar input[type="text"] {
      width: 300px;
      padding: 6px;
      border: none;
    }
    
    .search-bar input[type="submit"] {
      background-color: #333;
      color: #fff;
      border: none;
      padding: 6px 10px;
      cursor: pointer;
    }
    
    .slideshow-container {
      position: relative;
      width: 100%;
      max-width: 800px;
      margin: 0 auto;
    }
    
    .slideshow-container img {
      width: 100%;
      height: auto;
    }
    
    .slideshow-container .slide {
      display: none;
    }
    
    .slideshow-container .slide.active {
      display: block;
    }

    /* Dropdown styles */
    .profile-dropdown {
      position: relative;
      display: inline-block;
    }

    .dropdown-content {
      position: absolute;
      top: 100%;
      left: -60px; /* Adjust this value as per your preference */
      display: none;
      overflow: hidden;
      background-color: #333;
      min-width: 120px;
      box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
      padding: 12px 16px;
      z-index: 1;
      opacity: 0;
      transition: opacity 0.3s ease;
    }

    .profile-dropdown:hover .dropdown-content {
      display: block;
      opacity: 1;
      transition: opacity 0.3s ease;
    }
	
	.dropdown-content a {
    display: block;
    margin-bottom: 5px;
    white-space: nowrap; /* Ensures the content stays in a single line */
    
    nav .dropdown {
      position: relative;
    }

    nav .dropdown-content {
      display: none;
      position: absolute;
      background-color: #f9f9f9;
      min-width: 160px;
      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
      z-index: 1;
    }
    
  }
    
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body onload="loadCategories()">
  <header>
    <h1>SLAM Store</h1>
    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li class="dropdown">
          <form action="/process-category" method="POST">
            <select name="catg" id="catg"></select>
            <div id="display"></div>
          </form>
        </li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">&#128722; Cart</a></li>
        <li><a href="#">&#10084; WishList</a></li>
        <li class="profile-dropdown">
          <% if (!(Boolean) request.getAttribute("fl")) { %>
            <i class="fas fa-user-shield"></i>              
            <div class="dropdown-content">
              <a href="signUp">Sign Up</a>
              <a href="signIn">Sign In</a>
            </div>
          <% } else { %>
            <i class="fas fa-user-shield"></i>
            <div class="dropdown-content">
              <a href="profilePage">My Profile</a>
            </div>
          <% } %>
        </li>
      </ul>
    </nav>
  </header>

  <div class="search-bar">
    <form>
      <input type="text" placeholder="Search...">
      <input type="submit" value="Search">
    </form>
  </div>

  <main>
  <div id="prod"></div>
  <div id="transitionSlideShowPage">
    <div class="slideshow-container">
      <div class="slide active">
<img  src="https://static.digit.in/default/848e74e131ed5b8172357de25c0afb9bf691029c.jpeg?tr=w-1200" />
      </div>
      <div class="slide">
        <img src="https://mobirise.com/extensions/commercem4/assets/images/3.jpg" alt="Slide 2">
      </div>
      <div class="slide">
        <img src="https://t4.ftcdn.net/jpg/03/38/88/59/240_F_338885943_qQRG84nyD1CcTdXuVD4UbzMz1xBGWjBC.jpg" alt="Slide 3">
      </div>
   <div class="slide">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRBQy58C3pHvO6tN7zHCeTqq4L2t2-Kc5ENA&usqp=CAU" alt="Slide 5">
      </div>
    </div>
    </div>
    
    
    
    
  <!-- 
   modal WINDOW PROFILE PAGE
    <div id="profileCustomer">
    
    </div>
    
    <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="profileModalLabel">Profile Page</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
 <div class="modal-body">
  <ul class="profile-options" class="dropdown-content1">
    <li><a href="#">Profile</a></li>
    <li><a href="#">eCash</a></li>
    <li><a href="#">Orders</a></li>
    <li><a href="#">Wishlist</a></li>
    <li><a href="start">Sign Out</a></li>
  </ul>

</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> -->
    
    
     <div class="container mt-5">
        <h2>Product Catalog</h2>
  
        <div class="row mt-4">
            <c:forEach items="${products}" var="product">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <img class="card-img-top" src="${product.imageUrl}" alt="${product.name}">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">${product.description}</p>
                            <p class="card-text">${product.price}</p>
                            <button  class="btn btn-primary">Add to Cart</button>
                            <button class="btn btn-secondary">Add to Wishlist</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    
    
  </main>
  <footer>
    <p>&copy; 2023 SLAM Store. All rights reserved.</p>
  </footer>
<script>
  $(document).ready(function() {
    var slides = $('.slide');
    var currentSlide = 0;
    
    // Function to show the current slide
    function showSlide() {
      // Hide all slides
      slides.hide();
      
      // Show the current slide
      slides.eq(currentSlide).show();
    }
    
    // Function to move to the next slide
    function nextSlide() {
      currentSlide++;
      if (currentSlide >= slides.length) {
        currentSlide = 0;
      }
      showSlide();
    }
    
    // Start the slideshow
    setInterval(nextSlide, 3000); // Change slide every 3 seconds
  });
</script>


</body>
</html>