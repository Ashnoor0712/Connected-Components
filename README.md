# Connected Components Labeling in MATLAB

This project reads a binary image, converts it to grayscale and then to a binary format, and manually labels all connected components using a stack-based flood fill approach.

1. Overview

The script performs connected component labeling without relying on MATLAB's built-in `bwlabel` function for the main logic. It scans the binary image pixel by pixel, detects unlabeled foreground pixels, and assigns a unique label to each connected object.

Each connected region is displayed in a different color at the end.

2. What the code is about:

* Reads the image file `binary7.png`
* Converts the image to grayscale
* Converts the grayscale image into a binary image using a threshold
* Creates a matrix to store labels for each connected component
* Traverses the image pixel by pixel
* Uses a stack-based search to find all connected pixels belonging to the same object
* Assigns a unique label to each object
* Displays the labeled result using different colors
* Prints the total number of connected components

3. This project uses a mix of basic image processing and simple traversal logic:

- Binary thresholding  
  The grayscale image is converted into a binary image using a threshold to separate objects from the background.

- Connected component labeling  
  Each separate object in the image is identified and assigned a unique label.

- Stack-based traversal (DFS-like approach)  
  When an unvisited object pixel is found, a stack is used to explore all connected pixels until the entire region is covered.

- 4-connectivity  
  Each pixel is connected to its immediate neighbors: up, down, left, and right.

This approach keeps the implementation simple and ensures that all connected pixels are grouped correctly.

4. Input

- `binary7.png` — input image

5. Output

- A labeled matrix displayed with different colors
- Total number of connected components shown in the MATLAB command window


6. Notes

- The code uses a threshold of `128` to convert grayscale to binary:
  ```matlab
  BW = G < 128;
