const LINK = 'https://www.youtube.com/watch?v=EaEPCsQ4608';

var BUCKET = 'karaokemp-songs';

const fs = require('fs');
const ytdl = require('ytdl-core');
const AWS = require('aws-sdk');
AWS.config.loadFromPath('./config.json');
const S3 = new AWS.S3();
const mime = require('mime-types');

ytdl.getInfo(LINK, function(err, info) {
    let fileName = info.title + '.mp4';
    ytdl(LINK,{quality:'highest'}).pipe(fs.createWriteStream(fileName).on('finish', function() {
      console.log("downloaded " + fileName + ' !');
      fs.readFile(fileName, function (err, data) {
        if (err) { throw err; }
      
           let params = {Bucket: BUCKET, Key: fileName, Body: data,ContentType:mime.contentType(fileName) };
      
           S3.putObject(params, function(err, data) {
               if (err) {
      
                   console.log(err)
               } else {
                   console.log("Successfully uploaded song to S3!");
               }
            });
      });
                      
    }))
});
