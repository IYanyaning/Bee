import QtQuick
import QtQuick.Controls

Rectangle{
    id: loginPage
    // 发送登录信号
    signal loginChange(var name,var password)
    // 发送切换到reg注册界面信号
    signal changePageToReg()
    // 退出信号
    signal appExit()
    // 配置
//    Settings {
//        id: settings
//        fileName: "./config.ini"
//        property string userName
//        property string userPass

//    }

    Component.onCompleted:{
        clientSocket.receiveddata.connect(function(data1,data2){
            console.log(data1,data2)
          if(data1==="login")
          {
              if(data2==="true\n")
              {
                  loginMessageBox.visible = true
                   loginMessageBoxText.text = "账号密码错误或者不存在该用户";
              }
              else
              {
                  //clientSocket.requestGoods()
                  loginChange(userName.text,userPass.text)
                  clientSocket.writemsg(userName.text)
                  client.setName(userName.text)
                  //clientSocket.writemsg(userName.text)
                  //clientSocket.requestGoods()
                   username=userName.text

              }

          }

        }
        )
    }
//    Rectangle{
//        width: 300
//        height: 300
//        WebView{
//            url:"../html/map.html"
//        }
//    }

    Rectangle{
        id:signLogo
        width: parent.width
        height: 100
        Label{
            id:hello1
            text: "你 好!"
            font{
                family: "Microsoft YaHei"
                pixelSize: 30
            }
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            anchors.horizontalCenter:parent.horizontalCenter
        }
        Label{
            id:hello2
            text: "请登录你的账号"
            font{
                family: "Microsoft YaHei"
                pixelSize: 14
            }
            anchors.top: hello1.bottom
            anchors.topMargin: 10
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            anchors.horizontalCenter:parent.horizontalCenter
        }
    }

    Grid{
        id: userInfoList
        anchors.top: signLogo.bottom
        columns: 2
        rows : 2
        spacing: 10
        anchors.horizontalCenter:loginPage.horizontalCenter
        topPadding: 10
        Text{
            text: "用户名"
        }
        TextField {
            id:userName
        }
        Text{
            text: "密   码"
        }
        TextField {
            id:userPass
            echoMode: TextField.Password
            onAccepted: clientSocket.on_loginButton_clicked(userName.text,userPass.text)
        }
    }

    Rectangle{
        id:signin
        width: parent.width
        height: 30
        anchors.top: userInfoList.bottom
        anchors.topMargin: 50
        color: "#8B864E"
        Label{
            text: "登  录"
            anchors.fill: parent
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            font{
                family: "Microsoft YaHei"
                pixelSize: 20
            }
        }
        TapHandler{
            onTapped: {
                clientSocket.on_loginButton_clicked(userName.text,userPass.text)
            }

        }
    }

    Rectangle{
        id:signUp
        width: parent.width
        anchors.top: signin.bottom
        anchors.topMargin: 30
        height: 30
        Label{
            text: "没有账号？那注册一个吧！"
            anchors.fill: parent
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            font{
                family: "Microsoft YaHei"
                pixelSize: 14
            }
        }
        TapHandler{
            onTapped: {changePageToReg()}
        }
    }
    Popup {
        id: loginMessageBox
        visible: false
        anchors.centerIn: parent
        width: parent.width
        height: 40
        modal: true
        Text{
            id: loginMessageBoxText
            anchors.centerIn: parent
            text:"出错啦"
            width: parent.width
            anchors.fill: parent
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
        }
    }

}
