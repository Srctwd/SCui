from PIL import Image

# Open the image
chat = Image.open("chat.png").convert("1")  # Convert to grayscale if needed

# Get image dimensions
width, height = chat.size

# Iterate over every pixel in the image
for y in range(height):
    for x in range(width):
        pixel_value = chat.getpixel((x, y))
        print(f"Pixel at ({x}, {y}): {pixel_value}")