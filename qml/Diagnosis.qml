
import QtQuick.Controls
import QtQuick 2.0

Item {
    Rectangle{
        width: parent.width-30
        height: 100
        anchors.horizontalCenter:  parent.horizontalCenter
        TextArea{
            id:text_area
            anchors.fill: parent
            font{
                family: "Microsoft YaHei"
                pixelSize: 16
            }
            placeholderText: "描述"
            placeholderTextColor: "#666666"
            color:"black"
            selectByMouse: true
            selectionColor: "black"
            selectedTextColor: "white"
            wrapMode: TextInput.WrapAnywhere
        }
    }


//    Item {
//        width: 200
//        height: 100

//        AudioRecorder {
//            id: audioRecorder
//            audioInput: AudioInput {
//                source: AudioCaptureDevice.DefaultAudioDevice
//            }
//            outputLocation: "recording.wav"
//        }

//        // 开始录音按钮
//        Rectangle {
//            id: startButton
//            width: 100
//            height: 50
//            color: "blue"
//            border.color: "black"
//            border.width: 2
//            radius: 10
//            anchors.bottom: parent.bottom
//            anchors.horizontalCenter: parent.horizontalCenter
//            Text {
//                text: "Start"
//                font.pixelSize: 16
//                anchors.centerIn: parent
//            }
//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    // 开始录音
//                    audioRecorder.record()
//                }
//            }
//        }

//        // 停止录音按钮
//        Rectangle {
//            id: stopButton
//            width: 100
//            height: 50
//            color: "red"
//            border.color: "black"
//            border.width: 2
//            radius: 10
//            anchors.bottom: startButton.top
//            anchors.horizontalCenter: startButton.horizontalCenter
//            Text {
//                text: "Stop"
//                font.pixelSize: 16
//                anchors.centerIn: parent
//            }
//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    // 停止录音
//                    audioRecorder.stop()
//                }
//            }
//        }
//    }

}
