# Master-Project
Artist Identification of Van-Gogh paintings and their forgeries 
# Overview
This project was conducted at University of Paderborn in the SST group under the supervision of Prof. Dr. Peter Schreier. 

Two approaches, feature engineering and feature learning were used to complete the task of identifying the painting image as Van-Gogh or forgery. Additionally, we apply two dimensionality reduction techniques Principal Component Analysis (PCA) and Linear Dimensionality Reduction (LDA) on the data obtained after applying feature engineering and feature learning techniques. Finally, we use a fully-connected network and Support Vector Machine (SVM) as classifiers which are trained and tested separately.
#Feature Engineering (Nagarjun Gururaj and Hridkamol Biswas) 
Feature engineering refers to the classical feature extraction of images. Feature extraction consists of designing a filter which is convolved with the images to obtain the resulting output images. 

1) We have designed a 2D Gabor filter function which is convolved with the images of our dataset.
2) Also we have extracted the color features ike Hue and Saturation of the images by tranforming the image in RBG space to HSV space
3) Other generic features like mean and variance of the images are also extracted.




