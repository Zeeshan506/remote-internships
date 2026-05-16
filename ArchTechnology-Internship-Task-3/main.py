import cv2
from ultralytics import YOLO

# Load the YOLOv8n model from the 'models' directory
model_path = 'models/yolov8n.pt'
model = YOLO(model_path)

# Open the webcam (default is 0)
cap = cv2.VideoCapture(0)

# Check if the webcam is opened successfully
if not cap.isOpened():
    print("Error: Could not open webcam.")
    exit()

# Loop to read frames from the webcam
while True:
    # Read a frame from the video stream
    ret, frame = cap.read()

    # If the frame was not captured successfully, break the loop
    if not ret:
        print("Error: Could not read frame from webcam.")
        break

    # Perform object detection on the frame
    # We set a confidence threshold (e.g., 0.5) to filter out weak detections
    # and use the lowest image size (320) for better performance on your CPU.
    results = model(frame, conf=0.5, imgsz=320)

    # The 'results' object contains the detection information (bounding boxes, classes)
    # We can use the 'plot()' method to draw the bounding boxes on the frame
    annotated_frame = results[0].plot()

    # Display the annotated frame
    cv2.imshow('Real-time YOLO Detection', annotated_frame)

    # Break the loop if the 'q' key is pressed
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the webcam and destroy all OpenCV windows
cap.release()
cv2.destroyAllWindows()