var carousel = document.getElementById('carousel');
var next = document.getElementById('next');
var previous = document.getElementById('previous');

carousel.style.marginLeft = 0;
var farLeft = 0;
var farRight = -1224;
var imgWidth = 612;


// Slides the images to the left or goes back to the first image if it has reached the end
function toRight(){
  var currentLeft = parseInt(carousel.style.marginLeft);
  if (currentLeft > farRight ) {
    var target = currentLeft - imgWidth;//target to exit from sliding 
    var slide = window.setInterval(function(){
      carousel.style.marginLeft = parseInt(carousel.style.marginLeft) - 12 + "px";
      if (parseInt(carousel.style.marginLeft) === target){
        window.clearInterval(slide);
      }
    },10);
    } else {
    carousel.style.marginLeft = 0;
  }
}


// Slides the images to the right or goes back to the last image if it has reached the end
function toLeft(){
  var currentLeft = parseInt(carousel.style.marginLeft);
  if (currentLeft < 0 ) {//carousel
    var target = currentLeft + imgWidth;//target to exit from sliding function
    var slide = window.setInterval(function(){//create an interval and move the image 
         carousel.style.marginLeft = parseInt(carousel.style.marginLeft) + 12 + "px";//sliding the margin by 12px every movement
        if (parseInt(carousel.style.marginLeft) === target){
          window.clearInterval(slide);//clearing the slide function so it stops at the next image at the specific width
        }
      },10);//check every 10 milliseconds if it has reached the target, if not move it by the 12 above and if yes then stop at 612px.
  } else {
    carousel.style.marginLeft = currentLeft + farRight + "px";
  }
}


//mouseovers for the arrows opacity
function onHoverNext(){
  next.style.opacity = "1";
};

function onOutNext(){
  next.style.opacity = "0.5";
};
function onHoverPrev(){
  previous.style.opacity = "1";
};

function onOutPrev(){
  previous.style.opacity = "0.5";
};


//Hook up the next and previous buttons to call the toLeft and toRight functions
next.addEventListener("mouseover", onHoverNext);
next.addEventListener("mouseout", onOutNext);
previous.addEventListener("mouseover", onHoverPrev);
previous.addEventListener("mouseout", onOutPrev);

next.addEventListener("click", toRight);
previous.addEventListener("click", toLeft);

