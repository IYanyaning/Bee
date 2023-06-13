import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    height: 360
    width: 640
   // Layout.fillHeight: true
    //Layout.fillWidth: true
    id:mainPage


//    function getClientName(){
//        return client.m_ID
//    }



//    SwipeView {
//        id: view
//        //height: parent.height-560
//        width: parent.width
//        currentIndex: baseTabBar.currentIndex
//        //anchors.top: topbar.bottom

//        Home{
//            id:home
//            //height: 560
//            //height: mainPage.height-baseRec.height//560
//            height: mainPage.height
//            width: mainPage.width

//        }
//        Orders{
//            id:orders
//            height: mainPage.height-baseRec.height//560
//            width: mainPage.width
//        }
//        Mine{
//            id:mine
//            height: mainPage.height-baseRec.height//560
//            width: mainPage.width
//        }
//        News{
//            id:news
//            height: mainPage.height-baseRec.height//560
//            width: mainPage.width
//        }
//    }
    Rectangle{
        id:baseRec
        width: parent.width
        height:40
        anchors.bottom: parent.bottom
        border.color: "skyblue"
        anchors.bottomMargin: 0
        BaseTabBar{
            id:baseTabBar
            //anchors.bottom: parent.bottom
            //width: parent.width
            //height:parent.height
            anchors.bottomMargin: 0
            anchors.fill: parent
        }

    }
}




