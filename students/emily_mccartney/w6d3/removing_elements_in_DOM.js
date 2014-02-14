//function to remove elements from its parent node
function removeElement(node){
  var parent = node.parentNode;
  parent.removeChild(node);
};

//to append the element back into the DOM, before a certain elment, 
//append to the body and insert into a certain position
//you need to have both ul and soCute defined as variables
document.body.insertBefore(ul,soCute);

//update to accept more than one, an array of nodes and it should remove this

function removeElement(node){
  if (node[0] === undefined)
    {var parent = node.parentNode;
    parent.removeChild(node);}
  else
    for (var i = 0; i < node.length; i = i +1){
    var parent = node[i].parentNode;
    parent.removeChild(node[0]);
    }
}


function removeElement(node){
  if (node[0] === undefined)
    {var parent = node.parentNode;
    parent.removeChild(node);}
  else
    for (var i = node.length; i >= 0; i = i +1){
    var parent = node[i].parentNode;
    parent.removeChild(node[i]);
    }
}

///Function that works!
function removeElements(els){
  if (els.length !== undefined){
    for (var i = els.length - 1; i >=0; i = i-1){
      var el = els[i];
      el.parentNode.removeChild(el);
    }
  }else{
    els.parentNode.removeChild(els);
  }
}

