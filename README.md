# **STREOSCOPIC IMAGE QUALITY ASSESSMENT USING RESIDUAL AND CONVOLUTION NEURAL NETWORKS**
The quality assessment of stereoscopic images is essential to ensure an optimal viewing experience. Stereoscopic images rely on the combination of left and right views to create a perception of depth. Any degradation in quality, such as distortions or mismatches between the views, can disrupt this depth perception, leading to a subpar visual experience. For applications like virtual reality (VR) or augmented reality (AR), where users interact with 3D environments for extended periods, poor image quality can result in discomfort, eye strain, or even motion sickness. Thus, maintaining high quality is critical for user comfort and satisfaction.
# **Installation**
Make sure Python 3.x is installed on your system
### Required Libraries
- NumPy
- Pandas
- Tensorflow
- opencv
- skleran
- scipy
# **Technical Skills Required**
![image](https://github.com/user-attachments/assets/c6cb1854-cd07-4ffb-9e30-221c4dad5f55)
![image](https://github.com/user-attachments/assets/69580c2b-9bd1-4d7f-acf2-77adfc5f269d)
![image](https://github.com/user-attachments/assets/bcc173a9-57f2-4eb7-81c2-5ed14c311126)
![image](https://github.com/user-attachments/assets/69c76f61-e447-4350-b403-03e6c0562eed)
![image](https://github.com/user-attachments/assets/47ddf927-fb69-40db-a481-acf5f330cefe)
![image](https://github.com/user-attachments/assets/4ad2a81c-3502-4c62-94fc-f0e8fa8d5ff4)

# **Datasets**
### LIVE-PHASE1 DATASET
The 3D IQA database consists of 20 reference images and 365 distorted images (80 each for JP2K, JPEG, WN and FF; 45 for Blur).  
#### The files are named by the following rule:
For a stereo image pair, images are named as "img[num]_[view].bmp".    
For example, the stereo stimuli of image "im2_1.bmp" is stored as "im2_1_l.bmp" (left view) and "im2_1_r.bmp" (right view).
### LIVE-PHASE2 DATASET
The PhaseII 3D IQA database consists of 8 reference images and 360 distorted images with co-registered human scores in the form of DMOS. For each distortion type, every reference stereopair was processed to create three symmetric distorted stereopairs and six asymmetric distorted stereopairs.
#### The files are named by the following rule:  
For a stereo image pair, image pairs are named as "[num]img_[distortion_type]_[profile].bmp".
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
### 3D22MX DATASET
The database contains 15 indoor and 5 outdoor images out of the 20 scenarios to be evaluated by human observers.  
# **STEPS**
### 1) Calculate SSIM Score
Calculate structural similarity index score for each of the stereoscopic image and take the average score as the final score of the stereopair.
![image](https://github.com/user-attachments/assets/226c41cf-bc06-4aa0-b1ff-98719749778e)

Shown in following ipynb file:  
📋 https://github.com/d-rushma/STEREOSCOPIC_IQA/blob/master/MODEL/StereoImageQualityAssessment.ipynb  
### 2) Constructing Saliency Maps using Wavelet Transform
![image](https://github.com/user-attachments/assets/08e1cee3-8f84-4ea8-a378-5063c187f406)
![image](https://github.com/user-attachments/assets/e4c8796a-2745-4c33-949e-23efbfe457e6)
### 3) Construction of Residual Network Block
![Untitled Diagram drawio](https://github.com/user-attachments/assets/4459888d-fd20-4421-aa37-80a14b7b50ae)
### 4) Incorporating ResNet into Covolution Neural Networks
![cnn (7) drawio (4)](https://github.com/user-attachments/assets/c23ad734-844e-496f-9f5d-3db7e5a253a4)
# **RESULTS**
Results on datasets LIVE phase-I IQA, phase-II IQA and 3D22MX. The best performance values are highlighted. 
<img width="387" alt="{26EB64EE-B213-4679-A380-C68D92604BC3}" src="https://github.com/user-attachments/assets/b494dcd8-7673-438f-832b-a25995800752" />  
PLCC, SROCC, RMSE and KROCC evaluation metrics values for all types of distortions of all the datasets
<img width="433" alt="{DE186C35-4953-4C7E-A04A-0DABA5D040DC}" src="https://github.com/user-attachments/assets/28f99879-21ab-4d90-a6aa-0a668aae2e5d" />
