from flask import Flask, request
from flask_cors import CORS
import sys,subprocess
from pytube import YouTube

app = Flask(__name__)
CORS(app)
@app.route('/youtube', methods=['POST'])
def fromYoutubeToMega():
	link = request.args.get("link")
	print("downloading from link: " + link)
	YouTube(link).streams.filter(progressive=True, file_extension='mp4').first().download()
	print ("uploading to Mega...\n")
	subprocess.call('sh toMega.sh', shell=True)
	return 'uploaded clip from link ' + link + '\n'

