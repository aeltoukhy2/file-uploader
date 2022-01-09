from flask import Flask
from file_uploader import uploadFile
app = Flask(__name__)

@app.route("/")
def uploadFileEndpoint():
    return uploadFile()

if __name__ == "__main__":
    app.run(host='0.0.0.0')