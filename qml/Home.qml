import QtQuick
import QtQuick.Controls

Item {
    Rectangle{
        id:tit
        width: parent.width
        height: 30
        Text {
            anchors.topMargin: 10
            text: qsTr("金翼生物")
            color: "#3366ff"
            font{
                family: "Microsoft YaHei"
                pixelSize: 18
            }
            anchors.centerIn: parent
        }
    }

    Rectangle{
        width: parent.width-30
        height: 200
        anchors.top: tit.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            bottomPadding: 10
            rightPadding: 10
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            z:2
            text: qsTr("点击进入购买产品")
            font{
                family: "Microsoft YaHei"
                pixelSize: 18
            }
        }
        Image {
            id: productImage
            anchors.fill: parent
            source: "../images/product.jpg"
        }
        TapHandler{
            onTapped: {

            }
        }
    }

}
