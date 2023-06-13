import QtQuick
 import QtQuick.Controls
Rectangle{
    id: regUserPage
    // 切换登录
    signal changePageToLogin()
    // 退出信号
    signal appExit()
    // 配置
//    Settings {
//        id: settings
//        fileName: "./config.ini"
//        property string userName
//        property string userPass
//    }
    //


    Component.onCompleted:{
        clientSocket.receiveddata.connect(function(data1,data2){
          if(data1==="signup")
          {
              if(data2==="true\n")
              {
                  signupMessageBox.visible=false;
                  changePageToLogin();
              }
              else
              {
                  signupMessageBox.visible=true
                  signupMessageBoxText.text = "已存在该用户";

              }

          }

        }
        )
    }

    Popup {
        id: signupMessageBox
        visible: false
        anchors.centerIn: parent
        width: parent.width
        height: 40
        modal: true
        Text{
            id: signupMessageBoxText
            anchors.centerIn: parent
            text:""
            width: parent.width
        }
    }

    Rectangle{
        id:signLogo
        width: parent.width
        height: 100
        Label{
            id:hello1
            text: "注  册"
            font{
                family: "Microsoft YaHei"
                pixelSize: 30
            }
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            anchors.horizontalCenter:parent.horizontalCenter
        }
    }
    Grid{
        id: regUserInfoList
        anchors.top: signLogo.bottom
        columns: 2
        rows : 4
        spacing: 10
        anchors.horizontalCenter:regUserPage.horizontalCenter
        topPadding: 10
        Text{
            text: "用户名"
        }
        TextField {
            id: userName
        }
        Text{
            text: "密   码"
        }
        TextField {
            id: userPass
            echoMode: TextField.Password
        }
        Text{
            text: "电   话"
        }
        TextField {
            onAccepted: {
                clientSocket.on_signupButton_clicked(userName.text+":"+userPass.text)
                signupMessageBox.visible=true;
            }
        }
    }
    Rectangle{
        id:signup
        width: parent.width
        height: 30
        anchors.top: regUserInfoList.bottom
        anchors.topMargin: 50
        color: "#8B864E"
        Label{
            text: "注  册"
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
                clientSocket.on_signupButton_clicked(userName.text+":"+userPass.text)
                signupMessageBox.visible=true;
            }
        }
    }


    Rectangle{
        id:signIn
        width: parent.width
        anchors.top: signup.bottom
        anchors.topMargin: 30
        height: 30
        Label{
            text: "已经有账号了？那就登陆吧！"
            anchors.fill: parent
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            font{
                family: "Microsoft YaHei"
                pixelSize: 14
            }
        }
        TapHandler{
            onTapped: {changePageToLogin()}
        }
    }
}
