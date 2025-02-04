import sys
import pytesseract
import cv2
import sympy as sp
from googletrans import Translator

# Image ko Load karna
img_path = sys.argv[1]
image = cv2.imread(img_path)
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# OCR se Math Question Extract karna
text = pytesseract.image_to_string(gray, config='--psm 6')

# Solve the Math Problem
try:
    expr = sp.sympify(text.strip())
    solution = sp.simplify(expr)
except:
    solution = "Invalid math expression"

# Translate to Urdu
translator = Translator()
solution_urdu = translator.translate(f"Solved Answer: {solution}", dest='ur').text

# Print Results
print("\033[1;32mMath Question:\033[0m", text.strip())
print("\033[1;33mSolution:\033[0m", solution)
print("\033[1;36mSolution in Urdu:\033[0m", solution_urdu)
