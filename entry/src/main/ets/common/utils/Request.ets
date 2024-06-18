import common from '@ohos.app.ability.common';
import request from '@ohos.request';
import fs from '@ohos.file.fs';

export function uploadAudio() {
  let uploadTask;
  let uploadConfig = {
    url: 'http://192.168.31.70:5000/upload', //需要手动替换为真实服务器地址
    header: { 'Accept': '*/*' }, //设置请求头 例如：'User-Agent': 'Mozilla/5.0'
    method: "POST",
    files: [{ filename: "files", name: "file", uri: "internal://cache/records/test.wav", type: "wav" }],
    data: [{ name: "name123", value: "123" }], //放置表单数据比如本机用户信息等
  };
  try {
    request.uploadFile(globalThis.abilityContext, uploadConfig).then((data) => {
      uploadTask = data;
      let upProgressCallback = (uploadedSize, totalSize) => {
        console.info("upload totalSize:" + totalSize + "  uploadedSize:" + uploadedSize);
      };
      uploadTask.on('progress', upProgressCallback);
    }).catch((err) => {
      console.error('Failed to request the upload. Cause: ' + JSON.stringify(err));
    });
  } catch (err) {
    console.error('err.code : ' + err.code + ', err.message : ' + err.message);
  }
}

export function downloadAudio() {
  let context = getContext(this) as common.UIAbilityContext;
  let fileDir = context.filesDir;

  //文件如果已经存在，就删除
  if (fs.accessSync(fileDir + 'test.mp3')) {
    fs.unlink(fileDir + 'test.mp3')
  }

  let downloadTask;
  let downloadConfig = {
    url: 'http://downsc.chinaz.net/Files/DownLoad/sound1/201906/11582.mp3', //需要手动替换为真实服务器地址
    description: 'downloading processed file',
    header: {
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'zh-CN,zh;q=0.9',
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    },
    filePath: fileDir + 'test.mp3',
  };
  try {
    request.downloadFile(context, downloadConfig).then((data) => {
      downloadTask = data;
      let progressCallback = (receivedSize, totalSize) => {
        console.info("download receivedSize:" + receivedSize + " totalSize:" + totalSize);
      };
      downloadTask.on('progress', progressCallback);
      downloadTask.on('complete',()=>{
        console.info('download complete');
        let file = fs.openSync(fileDir + '/test.mp3', fs.OpenMode.READ_WRITE);
        let buf = new ArrayBuffer(1024);
        let readLen = fs.readSync(file.fd, buf);
        console.info(`The content of file: ${String.fromCharCode.apply(null, new Uint8Array(buf.slice(0, readLen)))}`);
        fs.closeSync(file);
      })
    }).catch((err) => {
      console.error('Failed to request the download. Cause: ' + JSON.stringify(err));
    })
  } catch (err) {
    console.error('err.code : ' + err.code + ', err.message : ' + err.message);
  }
}
