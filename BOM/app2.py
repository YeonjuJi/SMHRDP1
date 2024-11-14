from flask import Flask, request, jsonify
from flask_cors import CORS
from PIL import Image
import pytesseract
import cv2
import io
import numpy as np
import re
import json

app = Flask(__name__)
CORS(app)

# 실행 파일의 경로
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

def read_idcard(img):

    # 이미지 열기 (OpenCV로)
    # image = cv2.imread(img)
    image = np.array(img)

    # 이미지가 제대로 로드되었는지 확인
    if image is None:
        print(f"Error: Unable to open image at {img}")
        return "failed to load image"
    else:
        print("Image loaded successfully")

       # 이미지 크기 지정
        new_w = 400
        new_h = 300
        resized_image = cv2.resize(image, (new_w, new_h))

        # 이미지의 관심 영역 설정
        x, y, w, h = 5, 70, 360, 170
        roi = resized_image[y:y+h, x:x+w]

        # 관심 영역에 사각형 그리기
        cv2.rectangle(resized_image, (x, y), (x+w, y+h), (0, 255,0), 2)

        # 관심 영역이 표시된 이미지 불러오기
        # 이미지를 RGB로 변환하여 표시
        image_rgb = cv2.cvtColor(resized_image, cv2.COLOR_BGR2RGB)

        # ROI를 Pillow 이미지로 변환 (OCR 적용을 위해)
        roi_pil = Image.fromarray(cv2.cvtColor(roi, cv2.COLOR_BGR2RGB))

        # OCR 수행
        text = pytesseract.image_to_string(roi_pil, lang='kor')

        # 특수 문자와 공백 제거
        text = re.sub(r'[^\w\s]', '', text)
        text = text.replace(' ', '')

        # 각 줄을 key와 함께 출력
        lines = text.splitlines()
        keys = ["이름", "주민등록번호", "주소"]

        # 딕셔너리 생성
        result_dict = {keys[0]:lines[0], keys[1]:lines[1], keys[2]:lines[2:]}
        
        print(result_dict)
        return result_dict

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return 'No file part', 400

    file = request.files['file']
    if file.filename == '':
        return 'No selected file', 400

    
    img = Image.open(io.BytesIO(file.read()))
    extracted_text = read_idcard(img)
    # file.save('C:/Users/smhrd/Desktop/idcard/' + file.filename)

    # 유니코드 이스케이프를 비활성화하여 JSON 응답 생성
    return json.dumps(extracted_text, ensure_ascii=False)

if __name__ == '__main__':
    app.run(debug=True, port=5000)