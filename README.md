# file-uploader


Installation
install python
install megatools

How to run?from the command line:

1.find link to karaoke song on youtube.com
2. type sh run.sh <link-address>

as a server:
export FLASK_APP=server.py
python3 -m flask run

how to upload a link?
 curl -X POST localhost:5000/youtube?link=<your youtube link>

Have docker?

docker build -t file-server .

docker run -p 5000:5000 -it file-server
