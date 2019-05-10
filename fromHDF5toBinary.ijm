SourceDir = getDirectory("Choose Source Directory ");

TargetDir = getDirectory("Choose Destination Directory ");

list = getFileList(SourceDir);

N_Classes = 1

// Takes HDF5 file from Ilastik project and saves C2 class as tif file, change C2 in selectWindow to C1 to save that class instead and so on
for(i = 0; i < list.length; i++) {

     showProgress(i+1, list.length);
     title = SourceDir + list[i];
     run("Load HDF5 File...", "open=" + title);
     waitForUser('Click Ok after making HDF5 selections');
     setAutoThreshold("Otsu dark no-reset");
	setOption("BlackBackground", false);
	run("Convert to Mask", "method=Default background=Dark calculate");
	run("Fill Holes", "stack");
	run("Analyze Particles...", "size=10000-Infinity pixel show=Masks stack");
	run("Gaussian Blur...", "sigma=10 stack");
	setAutoThreshold("Default dark no-reset");
	run("Convert to Mask", "method=Default background=Dark calculate");
	run("Invert", "stack");
     
     
     AppendSaveName = 'Binary_'; 
     selectWindow("Mask of " +title + ": /exported_data"); 
     saveAs('.tiff', TargetDir+ AppendSaveName  + list[i]);
     close();
selectWindow(title + ": /exported_data");
close();
     
  
}