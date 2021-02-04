plots <- function(choice, dat, xax, yax, fi, title, laby, labx, name) {
  
  for (i in choice){ 
    
    if(i == "box"){ print(box <- plot_box(dat, xax, yax, fi, title, laby, labx, name)) }
    
    else if(i == "jit"){ print(jit <- plot_jit(dat, xax, yax, fi, title, laby, labx, name)) }
    
    else if(i == "vio"){ print (vio <- plot_vio(dat, xax, yax, fi, title, laby, labx, name)) } 
    
    else{print("error: a string other than box, jit, or vio has been entered")} } }

