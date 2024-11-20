document.addEventListener("DOMContentLoaded", function () {
  const navbarNav = document.querySelector(".navbar-nav"); 
  const hamburgerMenu = document.querySelector("#hamburger-menu");
  
  if (navbarNav && hamburgerMenu) {
    hamburgerMenu.onclick = () => {
      navbarNav.classList.toggle("active");
    };
  }
  
  const hamburger = document.querySelector("#hamburger-menu");
  document.addEventListener("click", function (e) {
    if (!hamburger.contains(e.target) && !navbarNav.contains(e.target)) {
      navbarNav.classList.remove("active");
    }
  });
  
  const data = window.apiData;
  console.log(data.DataCarousel)

  const carouselWrapper = document.getElementById("carouselWrapper");

    // Dynamically generate slides
    data.DataCarousel.data.forEach((item, index) => {
        const slide = document.createElement("div");
        slide.className = `carousel-slide ${index === 0 ? "active" : ""}`;
        slide.innerHTML = `
        <div class="containerCarousel">
          <img src="${item.img_path}" alt="${item.title}">
          <p class="carousel-title">${item.title}</p>
        <div>
        `;
        carouselWrapper.appendChild(slide);
    });

    // Add navigation functionality
    const slides = document.querySelectorAll(".carousel-slide");
    const prevButton = document.querySelector(".carousel-controls .prev");
    const nextButton = document.querySelector(".carousel-controls .next");
    let currentSlide = 0;

    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.remove("active");
            if (i === index) {
                slide.classList.add("active");
            }
        });
        carouselWrapper.style.transform = `translateX(-${index * 100}%)`;
    }

    prevButton.addEventListener("click", () => {
        currentSlide = (currentSlide - 1 + slides.length) % slides.length;
        showSlide(currentSlide);
    });

    nextButton.addEventListener("click", () => {
        currentSlide = (currentSlide + 1) % slides.length;
        showSlide(currentSlide);
    });

    // Auto-slide every 5 seconds
    setInterval(() => {
        currentSlide = (currentSlide + 1) % slides.length;
        showSlide(currentSlide);
    }, 5000);
})  
