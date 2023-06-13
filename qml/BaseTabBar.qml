import QtQuick
import QtQuick.Controls
TabBar {
    anchors.bottomMargin: 0
    property alias myModel: idTabbarModel
    property int lastIndex: 0
    id: idTabbar
    height: 40
    width:parent.width
    currentIndex: 0
    Component.onCompleted: {
        myModel.append({ "modelText": qsTr("首页"), "modelColor": "grey", "modelColorG": "#148014","modelSrc":"../images/11.png"
                       })
        myModel.append({ "modelText": qsTr("预警"), "modelColor": "grey", "modelColorG": "#148014","modelSrc":"../images/22.png"
                       })
        myModel.append({ "modelText": qsTr("诊断"), "modelColor": "grey", "modelColorG": "#148014","modelSrc":"../images/33.png"
                       })
        myModel.append({ "modelText": qsTr("我的"), "modelColor": "grey", "modelColorG": "#148014","modelSrc":"../images/33.png"
                       })
    }
    Repeater {
        id: idRepeaterControl
        model: idTabbarModel
        TabButton {
            height: 40
            //icon.source:modelSrc
            //icon.width: 32
            //icon.height: 32
            anchors.bottom: parent.bottom
            text: modelText
            //鼠标经过事件处理
            onHoveredChanged: {
                if (model.index !== idTabbar.currentIndex){
                    hovered ? text.color = modelColorG : text.color = modelColor
                }
            }
            //点击事件处理
            onClicked: {
                text.color = modelColorG;
                idTabbar.lastIndex = model.index;
            }
        }
    }
    ListModel {id: idTabbarModel}
}


