import QtQuick
import QtQuick.Controls
ApplicationWindow {
    id:faWindow
//    width: 400
//    height: 600
    width: 360
    height: 640
    visible: true
    title: qsTr("金翼生物")

    function onLoginChange(userName,userPass){
        console.log(userName,userPass)
    }
    // 点击退出处理函数
    function onAppExit(){
        faWindow.close()
    }
    Rectangle{
        id:sharingLogo
        width: parent.width
        height: 250
        Image {
            id: logo1
            source: "../images/logo01.png"
            anchors.fill: parent
        }
//        Label{
//            text: "金翼生物"
//            font{
//                family: "Microsoft YaHei"
//                pixelSize: 40
//            }
//            anchors.fill: parent
//            horizontalAlignment: Qt.AlignHCenter
//            verticalAlignment: Qt.AlignVCenter
//        }
    }
    Loginqml{
        id: loginPage
        visible: true
        width: parent.width
        height: parent.height - sharingLogo.height
        anchors.top: sharingLogo.bottom
        //anchors.centerIn: parent
        // 接受信号第一种（多处调用推荐）：可以调用公共方法，但是接收参数要与信号一致
        //  onLoginChange:  mainWindow.onLoginChange(name,password)
        // 接受信号第二种（只在这里使用的方法推荐这种）：匿名函数方式，参数可以不与信号参数一致
        onLoginChange:  function(userName,userPass){
            loginPage.visible = false

            var comMainPage = Qt.createComponent("MainPage.qml").createObject(faWindow,{width:faWindow.width, height:faWindow.height})

        }
        // 切换到注册界面
        onChangePageToReg: {
            loginPage.visible = false
            regUserPage.visible = true
        }
        // 接受信号
        onAppExit: faWindow.onAppExit()

    }
    RegUser{
        id: regUserPage
        visible: false
        width: parent.width
        height: parent.height - sharingLogo.height
        anchors.top: sharingLogo.bottom
        // 接受信号
        onAppExit: faWindow.onAppExit()
        // 切换到登录界面
        onChangePageToLogin: {
            regUserPage.visible = false
            loginPage.visible = true
        }
    }







}
