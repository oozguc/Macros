dir = getDirectory("");
title = getTitle();
run("Stack to Images");
n = nImages();
for (i = 0; i < n; ++i){
run("Save", "save=["+dir+replace(title, ".tif",n - i + ".tif") + "]" );
close();	
}



