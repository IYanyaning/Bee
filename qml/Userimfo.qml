import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs


Rectangle{
    width: parent.width
    height: parent.height

SplitView {
    id:userimfo
    width: parent.width
    height: parent.height
    //anchors.fill: parent
   // anchors.margins: 10
    property string name: "张三"



    orientation: Qt.Vertical
    handle: Rectangle{
        implicitHeight: 10
        visible: false
        height: 10
        color: "lightblue"
    }
    FileDialog{
        id:filedialog
        title: "Select an image"
        nameFilters : ["Images(*.png *.jpg *.jpeg)"]
        onAccepted: {
            userimg.source=Qt.resolvedUrl(selectedFile)
        }
    }



   // color: "red"

    Rectangle{
        id:usermain
        width:parent.width
        color: "pink"
       // height: parent.height/2
        SplitView.maximumHeight: 300
        SplitView.minimumHeight: 300


        Rectangle{
            id:touxiang
            width: 140
            height: 140
          //  radius: 100
            anchors.centerIn: parent
           // anchors.leftMargin:50


            Image {
                id: userimg
                anchors.fill: parent
                source: "../images/logo01.png"
                sourceSize.width: Math.min(width,userimg.width)
                sourceSize.height: Math.min(height,userimg.height)
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit

                TapHandler{
                    onTapped: {
                        filedialog.open()
                    }
                }
            }


         Row{
                id:mess
                width: parent.width
               // height: parent.height/4
                anchors.top:userimg.bottom
               // anchors.leftMargin: 40
                 anchors.margins: 30
            Label{
                id:username

                anchors.centerIn: parent


                font.pixelSize: 20
                //readOnly: true

                text:qsTr("   "+name)
            }
            }

        }

    }

    Column{
        id:othermess
        anchors.top: touxiang.bottom
        Rectangle{
            width: parent.width
            height: 60
            Text{

                anchors.centerIn: parent
                text:("完善信息")
            }
            TapHandler{
                onTapped: {}
            }
        }
        Rectangle{
           width: parent.width
            height: 60

            Text{
                anchors.centerIn: parent

                text:("完善信息")
            }
            TapHandler{
                onTapped: {}
            }
            }

        Rectangle{
            width: parent.width
            height: 60


            Text{
                anchors.centerIn: parent

                text:"关于产品"
            }
            TapHandler{
                onTapped: {}
            }

        }
        Rectangle{
           width: parent.width
            height: 60
            Text{
                anchors.centerIn: parent

                text:"关于产品"
            }
            TapHandler{
                onTapped: {}
            }
        }
    }
}
}
