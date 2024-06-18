import http from '@ohos.net.http';
import util from '@ohos.util';
import fs from '@ohos.file.fs';
import request from '@ohos.request';
import picker from '@ohos.file.picker';

@Entry
@Component
struct testPage {
  //连接、通讯历史记录
  @State msgHistory: string = ''
  //首页地址
  @State downloadUrl: string = "http://downsc.chinaz.net/Files/DownLoad/sound1/201906/11582.mp3"
  //登录地址
  @State loginUrl: string = "http://192.168.100.101:8081/auth"
  //用户名
  @State loginName: string = "zhanglei"
  //密码
  @State passwd: string = "cangjie"

  //下载到本地的路径
  @State localFilePath: string = ""

  scroller: Scroller = new Scroller()
  sessionId: string = ""

  build() {
    Row() {
      Column() {
        Text("Request下载示例")
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .textAlign(TextAlign.Center)
          .padding(10)
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          Text("用户名：")
            .fontSize(14)
            .width(80)
            .flexGrow(0)

          TextInput({ text: this.loginName })
            .onChange((value) => {
              this.loginName = value
            })
            .width(110)
            .fontSize(11)
            .flexGrow(1)

          Text("密码：")
            .fontSize(14)
            .width(60)
            .flexGrow(0)

          TextInput({ text: this.passwd })
            .onChange((value) => {
              this.passwd = value
            })
            .type(InputType.Password)
            .width(100)
            .fontSize(11)
            .flexGrow(1)
        }
        .width('100%')
        .padding(10)

        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          Text("登录地址：")
            .fontSize(14)
            .width(80)
            .flexGrow(0)

          TextInput({ text: this.loginUrl })
            .onChange((value) => {
              this.loginUrl = value
            })
            .width(100)
            .fontSize(11)
            .flexGrow(1)
          Button("登录")
            .onClick(() => {
              this.login()
            })
            .width(70)
            .fontSize(14)
            .flexGrow(0)
        }
        .width('100%')
        .padding(10)

        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          Text("文件地址：")
            .fontSize(14)
            .width(80)
            .flexGrow(0)

          TextInput({ text: this.downloadUrl })
            .onChange((value) => {
              this.downloadUrl = value
            })
            .width(110)
            .fontSize(11)
            .flexGrow(1)

          Button("下载")
            .onClick(() => {
              this.downloadFile()
            })
            .width(70)
            .fontSize(14)
            .flexGrow(0)
        }
        .width('100%')
        .padding(10)

        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          Text("保存位置：")
            .fontSize(14)
            .width(80)
            .flexGrow(0)

          TextInput({ text: this.localFilePath })
            .width(110)
            .fontSize(11)
            .flexGrow(1)
        }
        .width('100%')
        .padding(10)

        Scroll(this.scroller) {
          Text(this.msgHistory)
            .textAlign(TextAlign.Start)
            .padding(10)
            .width('100%')
            .backgroundColor(0xeeeeee)
        }
        .align(Alignment.Top)
        .backgroundColor(0xeeeeee)
        .height(300)
        .flexGrow(1)
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.On)
        .scrollBarWidth(20)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .height('100%')
    }
    .height('100%')
  }

  //下载文件
  downloadFile() {
    this.localFilePath = getContext(this).tempDir + "/demo.mp3"

    //文件如果已经存在，就删除
    if (fs.accessSync(this.localFilePath)) {
      fs.unlink(this.localFilePath)
    }

    let cfg: request.DownloadConfig = {
      url: this.downloadUrl,
      header: {
        'Accept-Encoding': 'gzip, deflate, br',
        'Accept-Language': 'zh-CN,zh;q=0.9',
        //这一步很关键，把登录成功后的cookie传递过去
        'Cookie': 'sessionid=' + this.sessionId,
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
      },
      filePath: this.localFilePath }

    let downloadTask: request.DownloadTask;

    try {
      request.downloadFile(getContext(this), cfg
        , (err, data) => {
          if (err) {
            console.error('Failed to request the download. Cause: ' + JSON.stringify(err));
            return;
          }
          downloadTask = data;
          downloadTask.on("progress", (size, tot) => {
            this.msgHistory += `下载进度：${size}/${tot}\r\n`
          })
          downloadTask.on("complete", () => {
            this.msgHistory += "下载完成\r\n"
            //读取文件内容并显示
            this.showFileContent(this.localFilePath)
          })
        });
    } catch (err) {
      this.msgHistory += 'err.code : ' + err.code + ', err.message : ' + err.message;
    }
  }

  //显示指定文件的内容
  showFileContent(filePath: string) {
    this.msgHistory += "文件内容：" + "\r\n"
  }

  //模拟登录
  login() {
    //http请求对象
    let httpRequest = http.createHttp();
    //请求的登录名和密码参数
    let params = "username=" + this.loginName + "&password=" + this.passwd

    let opt: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      extraData: params,
      header: { 'Content-Type': 'application/x-www-form-urlencoded' },
      expectDataType: http.HttpDataType.STRING
    }

    httpRequest.request(this.loginUrl, opt)
      .then((resp) => {
        this.msgHistory += "响应码：" + resp.responseCode + "\r\n"
        //返回的首部信息中，cookie的格式为：
        // set-cookie: sessionid=19837d50s270ms999us100ns; Max-Age=1800; Path=/
        //这里需要记录下sessionid，作为下次提交时的cookie信息
        let cookies: string = resp.header["set-cookie"]
        this.sessionId = cookies.split(";")[0].split("=")[1]
        this.msgHistory += "sessionId：" + this.sessionId + "\r\n"
        this.msgHistory += "登录成功\r\n"

      })
      .catch((e) => {
        this.msgHistory += "登录失败：" + e.message + "\r\n"
      })
  }
}