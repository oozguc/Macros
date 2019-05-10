dir = getDirectory("");
title = getTitle();
selectWindow(title);

run("Split Channels");
selectWindow("C1-"+ title);
saveAs("tiff",dir+"C1-"+ title);
close();
selectWindow("C2-"+ title);
saveAs("tiff",dir+"C2-"+ title);
selectWindow("C3-"+ title);
saveAs("tiff",dir+"C3-"+ title);
close();

selectWindow("C2-"+ title);
run("Median...", "radius=5 stack");
run("Gaussian Blur...", "sigma=2 stack");
saveAs("Tiff", dir+replace(title, ".tif","_toBinary" + ".tif"));
close();
