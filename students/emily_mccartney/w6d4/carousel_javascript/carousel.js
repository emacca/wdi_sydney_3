var carousel = document.getElementById('carousel');
var next = document.getElementById('next');
var previous = document.getElementById('previous');

carousel.style.marginLeft = 0;
var farLeft = 0;
var farRight = -1224;
var imgWidth = 612;


// // Slides the images to the left or goes back to the first image if it has reached the end
// function toLeft(){
//   if (parseInt(carousel.style.marginLeft) > -1224 ) {
//     var target = parseInt(carousel.style.marginLeft) - 612;//target to exit from sliding 
//     var slide = window.setInterval(function(){
//       carousel.style.marginLeft = parseInt(carousel.style.marginLeft) - 12 + "px";
//       if (parseInt(carousel.style.marginLeft) === target){
//         window.clearInterval(slide);
//       }
//     },10);
//     } else {
//     carousel.style.marginLeft = 0;
//   }

// }


// // Slides the images to the right or goes back to the last image if it has reached the end
// function toRight(){
//   if (parseInt(carousel.style.marginLeft) < 0 ) {//carousel
//     var target = parseInt(carousel.style.marginLeft) + 612;//target to exit from sliding function
//     var slide = window.setInterval(function(){//create an interval and move the image 
//          carousel.style.marginLeft = parseInt(carousel.style.marginLeft) + 12 + "px";//sliding the margin by 12.5px every movement
//         if (parseInt(carousel.style.marginLeft) === target){
//           window.clearInterval(slide);//clearing the slide function so it stops at the next image at the specific width
//         }
//       },10);//check every 10 milliseconds if it has reached the target, if not move it by the 12.25 above and if yes then stop at 612px.
//   } else {
//     carousel.style.marginLeft = parseInt(carousel.style.marginLeft) -1224 + "px";
//   }
// }
function toRight(){
  var currentLeft = parseInt(carousel.style.marginLeft);
  //if hit right side reset to left
  if (currentLeft <= farRight) {
    carousel.style.marginLeft = farLeft + "px";// far left

  } else {
    //else slide to the right (1)
    carousel.style.marginLeft = currentLeft - imgWidth + "px";
  }

}


function toLeft(){
  var currentLeft = parseInt(carousel.style.marginLeft);
  //if hit left side reset to right
  if (currentLeft >= farLeft) {
    carousel.style.marginLeft = farRight + "px";// far right

  } else {
    //else slide to the left (1)
    carousel.style.marginLeft = currentLeft + imgWidth + "px";
  }

}



// var target = currentLeft + imgWidth;// far right
//     var slide = window.setInterval(function(){
//       carousel.style.marginLeft = parseInt(carousel.style.marginLeft) - 12 + "px";
//       if (currentLeft === target){
//         window.clearInterval(slide);
//       }
//     },10);


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

