import QtQuick
import QtQuick.Controls
import QtQml
import QtSpeechRecognition 1.0
Item {
    Rectangle{
        id:tit
        width: parent.width
        height: 30
        Text {
            text: qsTr("热力图")
            color: "#3366ff"
            font{
                family: "Microsoft YaHei"
                pixelSize: 18
            }
            anchors.centerIn: parent
        }
    }
    Rectangle{
        id:maoRec
        width: parent.width-30
        height: 300
        anchors.top: tit.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        Image {
            id: mapImg
            anchors.fill: parent
            source: "../images/map.png"
        }
    }
}
