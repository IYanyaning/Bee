import QtQuick
import QtQuick.Controls

Item {

    id:checking
    width: parent.width
    //height: parent.height
    property string advices: "1dsadsadwadsdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddadwadsad"
    property int s: 0
    Row{
        id:choseis
        width: parent.width
        height: parent.height/2
        anchors.centerIn: parent

        Text {
            id: imfo
            font.pixelSize: 18
            text: qsTr("试剂检测：")
        }
        ComboBox{
            id:combobox
            anchors.left: imfo.right
            width: 180
            height: 30
            model: ["阴性","阳性"]

            onActivated: {
                var i=textAt(index)
                if(i==="阳性")
                {
                    s=1
                }
                else{
                    s=0
                }
            }
        }


        Rectangle{
            anchors.left: combobox.right
            width: 60
            height: 30
            Text {
                anchors.centerIn: parent
                text: qsTr("确定")
            }

        TapHandler{
            onTapped: {
                if(s===1){
                choseis.enabled=false
                //choseis.visible=false
                advice.y=choseis.height+100
                advice.visible=true
                }
            }
        }
        }


    }
    Rectangle{
        id:advice
        visible: false

        width: parent.width
        height: parent.height/2

        TextArea{
            property int prelinecount: 1
            width: parent.width
            height: 200
            readOnly: true
            anchors.top: exit.bottom
            id: text_area
            text: advices
            font{
                family: "Microsoft YaHei"
                pixelSize: 14
            }
            color: "#666666"
            selectByMouse: true
            selectionColor: "black"
            selectedTextColor: "white"
            wrapMode: TextInput.WrapAnywhere
            background: Rectangle{
                border.color: "gray"
            }
            onLineCountChanged: {
                if(text_area.lineCount>prelinecount)
                {
                    talkrt.implicitHeight-=15
                }
                else if(text_area.lineCount<prelinecount)
                {
                    talkrt.implicitHeight+=15
                }
                prelinecount=text_area.lineCount
            }

        }

        Rectangle{
            id:exit
            width: 40
            height: 40
            anchors.right: parent.right
            Text {
               anchors.centerIn: parent
               font.pixelSize: 18
                text: qsTr("exit")
            }
            TapHandler{
            onTapped: {
                choseis.enabled=true
                advice.visible=false
            }
            }
        }
    }

}
