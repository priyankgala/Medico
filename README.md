# Medico
Final project for INFO 6210 - Database Management and Database Design course at Northeastern University's College of Engineering. INFO6210 was designed from an introductory perspective to get familiarize with SQL script and relational databases.

# Project Description
Imaging has become an essential component in many fields of medical and laboratory research and clinical practice. The need for a comprehensive and automated method of disease screening has long been recognized, and there have been previous efforts for image classification through pattern recognition, and machine learning. To aid this further we have proposed a system to process medical images in real-time to create a new learning model resulting in realistic clinical analysis for different types of medical images such as Xray, MRI, CT scan. We implemented the idea using-

1. OpenCV (Python library) along with Tesseract OCR for text detection and EAST Text Algorithm to extract text from the medical image
2. MySQL relation database to store the extracted information from the image and apply stored procedures and triggers to provide a realistic clinical analysis

# Design considerations
Aim of this project was to provide a realistic clinical analysis, but due to lack of (real) medical images we have edited the images in DICOM format adding some unimportant texts on the image.

