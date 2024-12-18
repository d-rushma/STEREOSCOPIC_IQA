----------------------------------
LIVE 3D Image Quality Database
----------------------------------

Copyright Notice

-----------COPYRIGHT NOTICE STARTS WITH THIS LINE------------
Copyright (c) 2012 The University of Texas at Austin
All rights reserved.

Permission is hereby granted, without written agreement and without license or royalty fees, 
to use, copy, modify, and distribute this database (the images, the results and the source files) 
and its documentation for any purpose, provided that the copyright notice in its entirety appear 
in all copies of this database, and the original source of this database, Laboratory for Image 
and Video Engineering (LIVE, http://live.ece.utexas.edu) and Center for Perceptual Systems 
(CPS,http://www.cps.utexas.edu) at the University of Texas at Austin (UT Austin, http://www.utexas.edu), 
is acknowledged in any publication that reports research using this database.

The following papers are to be cited in the bibliography whenever the database is used as:

• A.K. Moorthy, C.-C. Su, A. Mittal and A.C. Bovik, “Subjective evaluation of stereoscopic image quality,” 
Signal Processing: Image Communication, to appear, 2012. 

• URL: http://live.ece.utexas.edu/research/quality/live_3dimage_phase1.html

IN NO EVENT SHALL THE UNIVERSITY OF TEXAS AT AUSTIN BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, 
SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF THIS DATABASE AND ITS 
DOCUMENTATION, EVEN IF THE UNIVERSITY OF TEXAS AT AUSTIN HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

THE UNIVERSITY OF TEXAS AT AUSTIN SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE DATABASE 
PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND THE UNIVERSITY OF TEXAS AT AUSTIN HAS NO OBLIGATION
TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

-----------COPYRIGHT NOTICE ENDS WITH THIS LINE------------

Anush Krishna Moorthy  - Email: anushmoorthy@gmail.com

REFERENCES
----------

1. A.K. Moorthy, C.-C. Su, A. Mittal and A.C. Bovik, “Subjective evaluation of stereoscopic image quality,” 
Signal Processing: Image Communication, to appear, 2012. 


2. URL: http://live.ece.utexas.edu/research/quality/live_3dimage_phase1.html

 3D Images and depth maps
----------------------------

The 3D IQA database consists of 20 reference images and 365 distorted images 
(80 each for JP2K, JPEG, WN and FF; 45 for Blur) with co-registered human scores in 
the form of DMOS. All distortions are symmetric in nature. Apart from human opinion scores
 for every distorted image, the database also provides researchers access with `true' depth 
information of every reference image obtained from a range scanner, which all of the above
 databases lack. The image and range data used in this study were collected using an advanced
 terrestrial range scanner, the RIEGL VZ-400, with a co-registered 12.1 megapixel Nikon D700
 digital camera mounted on top of it.



FILENAMING FOR IMAGES, DEPTH MAPS, AND DISPARITY MAPS
---------------------
The files are named by the following rule:
For a stereo image pair, images are named as "img[num]_[view].bmp". 
The corresponding depth map of an image is stored at "img[num]_[view]_map.mat". 
The disparity map is stored at "img[num]_[view]_Dmap.mat". 
For example, the stereo stimuli of image "im2_1.bmp" is stored as "im2_1_l.bmp" (left view) and "im2_1_r.bmp" (right view).
Its corresponding depth maps are stored at "img2_l_map.mat" and "img2_r_map.mat" and disparity maps are stored at "img2_l_Dmap.mat" and "img2_r_Dmap.mat".
!!Depth maps and disparity maps are provided for reference images. 

SUBJECTIVE DATA FORMAT
----------------------
The file data.mat contain dmos, ref_names, and img_names.
dmos is an arry of length 365 and ref_names and img_names are cell of length 365.
The array dmos provides subjective ratings given to the 365 distorted stimuli. 
ref_names and img_names provide file names for these 365 distorted stimuli.
 




