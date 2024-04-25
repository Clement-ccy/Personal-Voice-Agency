import request from '@ohos.request';
import common from '@ohos.app.ability.common';
export function uploadWav() {
  let context: common.Context;
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

export function downloadWav() {
  let context: common.Context;
  let downloadTask;
  let downloadConfig = {
    url: 'http://192.168.31.70:5000/get_processed_file/processed_yourfile.wav', //需要手动替换为真实服务器地址
    enableMetered: false, //设置是否允许在按流量计费的连接下下载
    enableRoaming: false, //设置是否允许在漫游网络中下载
    description: 'downloading processed file',
    filePath: context.filesDir + '/audio_processed' + '/test_processed.wav',
    networkType: 0x00000001&0x00010000, //设置允许下载的网络类型(默认使用NETWORK_MOBILE&NETWORK_WIFI)
    title:'111',
    background:false
  };
  try {
    request.downloadFile(globalThis.abilityContext, downloadConfig).then((data) => {
      downloadTask = data;
      let progressCallback = (receivedSize, totalSize) => {
        console.info("download receivedSize:" + receivedSize + " totalSize:" + totalSize);
      };
      downloadTask.on('progress', progressCallback);
    }).catch((err) => {
      console.error('Failed to request the download. Cause: ' + JSON.stringify(err));
    })
  } catch (err) {
    console.error('err.code : ' + err.code + ', err.message : ' + err.message);
  }
}
