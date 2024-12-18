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

- Ming-Jun Chen, Che-Chun Su, Do-Kyoung Kwon, Lawrence K. Cormack, Alan C. Bovik, "Full-reference quality assessment of stereopairs accounting for rivalry, Signal Processing: Image Communication, 2013.

- Ming-Jun Chen, Lawrence K. Cormack, Alan C. Bovik, "No-Reference Quality Assessment of Natural Stereopairs," IEEE Transactions on Image Processing, vol.22, no.9, pp.3379~3391, Sept. 2013

- URL: http://live.ece.utexas.edu/research/quality/live_3dimage_phase2.html

IN NO EVENT SHALL THE UNIVERSITY OF TEXAS AT AUSTIN BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, 
SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF THIS DATABASE AND ITS 
DOCUMENTATION, EVEN IF THE UNIVERSITY OF TEXAS AT AUSTIN HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

THE UNIVERSITY OF TEXAS AT AUSTIN SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE DATABASE 
PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND THE UNIVERSITY OF TEXAS AT AUSTIN HAS NO OBLIGATION
TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

-----------COPYRIGHT NOTICE ENDS WITH THIS LINE------------


Ming-Jun Chen  - Email: mjchen@utexas.edu


REFERENCES
----------

- Ming-Jun Chen, Che-Chun Su, Do-Kyoung Kwon, Lawrence K. Cormack, Alan C. Bovik, "Full-reference quality assessment of stereopairs accounting for rivalry, Signal Processing: Image Communication, 2013.

- Ming-Jun Chen; Cormack, L.K.; Bovik, A.C., "No-Reference Quality Assessment of Natural Stereopairs," Image Processing, IEEE Transactions on , vol.22, no.9, pp.3379,3391, Sept. 2013

- URL: http://live.ece.utexas.edu/research/quality/live_3dimage_phase2.html


3D IMAGES AND DEPTH MAPS
------------------------

The PhaseII 3D IQA database consists of 8 reference images and 360 distorted images with 
co-registered human scores in the form of DMOS. For each distortion type, every reference 
stereopair was processed to create three symmetric distorted stereopairs and six asymmetric 
distorted stereopairs. Apart from human opinion scores for every distorted image, the database 
also provides researchers access with `true' depth information of every reference image obtained 
from a range scanner. The image and range data used in this study were collected using an advanced 
terrestrial range scanner, the RIEGL VZ-400, with a co-registered 12.1 megapixel Nikon D700 digital 
camera mounted on top of it.


FILENAMING FOR IMAGES, DEPTH MAPS, AND DISPARITY MAPS
-----------------------------------------------------

The files are named by the following rule:
For a stereo image pair, image pairs are named as 
"[num]img_[distortion_type]_[profile].bmp".
The range of "distortion_type" are from 1 to 5, where 
1- White noise
2- JPEG_2000
3- JPEG
4- Gaussian Blur
5- Fast Fading

The range of "profile" are from 0 to 9, where
0 - is the reference image without any distortion 
1,2,3,5,6,8 - are "asymmetrically" distorted stereo image pair
4,7,9 - are "symmetrically" distorted stereo image pair

The corresponding depth map of an image is stored at "[num]_[view]_map.mat". 
The disparity map is stored at "[num]_[view]_Dmap.mat". 
For example, the stereo stimuli of image "003image_1_0.bmp" are "003image_1_1.bmp","003image_1_2.bmp",... and "003image_1_9.bmp".
Its corresponding depth maps are stored at "003_L_map" and "003_R_map" and disparity maps are stored at "003_L_Dmap" and "003_R_Dmap" 
!!Depth maps and disparity maps are provided for reference images. 


SUBJECTIVE DATA FORMAT
----------------------

The file 3DDmosRelease.mat contain Dmos, RefFilename, and StiFilename.
Dmos is an arry of length 360 and RefFilename and StiFilename are cell of length 360.
The array Dmos provides subjective ratings given to the 360 distorted stimuli. 
RefFilename and StiFilename provide file names for these 360 distorted stimuli.
 
