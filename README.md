PDF Generator App
This Flutter application allows users to input text, select an image, and generate a PDF document with the embedded image and the text. The generated PDF can then be downloaded and saved locally.

Features
Text Input: Users can enter custom text to be embedded in the PDF.
Image Selection: Users can choose an image from their gallery or take a new picture.
PDF Generation: The app generates a PDF document with the selected image and input text.
Download and Save: Users can download the generated PDF to their device.
Screenshots

Getting Started
Prerequisites
Make sure you have the following installed:

Flutter SDK: Install Flutter
A device or emulator to run the application
Installation
Clone the repository:

bash
Copy code
git clone https://github.com/yourusername/pdf_generator_app.git
cd pdf_generator_app
Install dependencies:

bash
Copy code
flutter pub get
Run the app:

bash
Copy code
flutter run
Usage
Enter Text: On the main screen, enter the text you want to include in the PDF.
Select an Image: Click the "Select Image" button to choose an image from your gallery or take a new photo.
Generate PDF: Press the "Generate PDF" button to create the PDF with the embedded image and text.
Download PDF: After the PDF is generated, click the "Download PDF" button to save the file to your device.
Dependencies
The app relies on the following packages:

flutter_image_picker: To allow users to select or capture images.
pdf: To create and manage PDF documents.
path_provider: To access the device's file system.
open_file: To open the generated PDF file.
