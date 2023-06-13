import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
ApplicationWindow {
    id:faWindow
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
    Popup{
        id:collectInfor
        visible: false
        anchors.centerIn: parent
        width: parent.width
        height: 300
        Component.onCompleted:{
            var provinces = ["北京市", "上海市", "天津市", "重庆市", "河北省", "山西省", "内蒙古自治区", "辽宁省", "吉林省", "黑龙江省", "江苏省",
                                "浙江省", "安徽省", "福建省", "江西省", "山东省", "河南省", "湖北省", "湖南省", "广东省", "广西壮族自治区", "海南省", "四川省",
                                "贵州省", "云南省", "西藏自治区", "陕西省", "甘肃省", "宁夏回族自治区", "青海省", "新疆维吾尔族自治区", "香港特别行政区", "澳门特别行政区",
                                "台湾省"
                            ]

            for(var i=0;i< provinces.length;i++){
                var pro = provinces[i];
                provinceModel.append({name:pro});
            }
//            for(var j =0;j<citys.length;j++){
//                var cit = citys[j];
//                console.log(cit[0])
//                cityModel
//            }
//            console.log(cityModel.get(0).names.get(0))
        }
        Rectangle{
            id:popRec
            anchors.fill: parent
            ListModel{id:provinceModel}
            ListModel{id:cityModel}

            ColumnLayout{
                spacing: 20
                Rectangle{
                    width: 345
                    height: 30
                    anchors.topMargin: 10
                    Label{
                        id:headRec
                        text: "登录成功，请录入信息"

                        anchors.centerIn: parent
                        font{
                            family: "Microsoft YaHei"
                            pixelSize: 20
                        }
                    }
                }
                Rectangle{
                    width: 345
                    height: 50
                    anchors.horizontalCenter: popRec.horizontalCenter
                    Text {
                        id: address
                        text: qsTr("选择地区")
                        font{
                            family: "Microsoft YaHei"
                            pixelSize: 14
                        }
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    ComboBox{
                        id:province
                        anchors.left: address.right
                        anchors.leftMargin: 10
                        //anchors.top: headRec.bottom
                        width: 125
                        height: 30
                        anchors.verticalCenter: parent.verticalCenter
                        currentIndex: 0
                        model: provinceModel
                        onCurrentIndexChanged: {
                            var citys = [
                                                ["东城", "西城", "崇文", "宣武", "朝阳", "丰台", "石景山", "海淀", "门头沟", "房山", "通州", "顺义", "昌平", "大兴",
                                                    "平谷", "怀柔", "密云", "延庆"
                                                ],
                                                ["黄浦", "卢湾", "徐汇", "长宁", "静安", "普", "闸北", "虹口", "杨浦", "闵行", "宝山", "嘉定", "浦东", "金山",
                                                    "松江", "青浦", "南汇", "奉贤", "崇明"
                                                ],
                                                ["和平", "东丽", "河东", "西青", "河西", "南", "南开", "北辰", "河北", "武清", "红挢", "塘沽", "汉沽", "大港",
                                                    "宁河", "静海", "宝坻", "蓟县"
                                                ],
                                                ["万州", "涪陵", "渝中", "大渡口", "江北", "沙坪", "九龙坡", "南岸", "北碚", "万盛", "双挢", "渝北", "巴南", "黔江",
                                                    "长寿", "綦江", "潼南", "铜梁 ", "大足", "荣昌", "壁山", "梁平", "城口", "丰都", "垫江", "武隆", "忠县", "开县",
                                                    "云", "奉节", "巫山", "巫溪", "石柱", "秀山", "酉阳", "彭水", "江津", "合川", "永川", "南川"
                                                ],
                                                ["石家庄", "邯郸", "邢台", "保定", "张家口", "承德", "廊坊", "唐山", "秦皇岛", "沧州", "衡水"],
                                                ["太原", "大同", "阳泉", "长治", "晋城", "朔州", "吕梁", "忻州", "晋中", "临汾", "运城"],
                                                ["呼和浩特", "包头", "乌海", "赤峰", "呼伦贝尔盟", "阿拉善盟", "哲里木盟", "兴安盟", "乌兰布盟", "锡林郭勒盟", "巴彦淖尔盟",
                                                    "伊克昭盟"
                                                ],
                                                ["沈阳", "大连", "鞍山", "抚顺", "本溪", "东", "锦州", "营口", "阜新", "辽阳", "盘锦", "铁岭", "朝阳", "葫芦岛"],
                                                ["长春", "吉林", "四平", "辽源", "通化", "白山", "松原", "白城", "延边"],
                                                ["哈尔滨", "齐齐哈尔", "牡丹江", "佳木斯", "大庆", "绥化", "鹤岗", "鸡西", "黑河", "双鸭山", "伊春", "七台河", "大安岭"],
                                                ["南京", "镇江", "苏州", "南通", "扬州", "盐城", "徐州", "连云", "常州", "无锡", "宿迁", "泰州", "淮安"],
                                                ["杭州", "宁波", "温州", "嘉兴", "湖州", "绍兴", "金华", "衢州", "舟山", "台州", "丽"],
                                                ["合肥", "芜湖", "蚌埠", "马鞍山", "淮北", "铜陵", "安庆", "黄山", "滁州", "宿州", "池州", "淮南", "巢", "阜阳",
                                                    "六安", "宣城", "亳州"
                                                ],
                                                ["福州", "厦门", "莆田", "三明", "泉州", "漳州", "南", "龙岩", "宁德"],
                                                ["南昌市", "景德镇", "九江", "鹰潭", "萍乡", "新馀", "赣州", "吉安", "宜春", "抚州", "上饶"],
                                                ["济南", "青岛", "淄博", "枣庄", "东营", "烟台", "潍坊", "济宁", "泰安", "威海", "日照", "莱芜", "沂", "德州",
                                                    "聊城", "滨州", "菏泽"
                                                ],
                                                ["郑州", "开封", "洛阳", "平顶山", "安阳", "鹤壁", "新", "焦作", "濮阳", "许昌", "漯河", "三门峡", "南阳", "商丘",
                                                    "信阳", "周口", "驻马店", "济源"
                                                ],
                                                ["武汉", "宜昌", "荆州", "襄樊", "黄石荆门", "黄冈", "十堰", "恩施", "潜江", "天门", "仙桃", "随州", "咸宁", "孝感",
                                                    "鄂州"
                                                ],
                                                ["长沙", "常德", "株洲", "湘潭", "衡阳", "岳阳", "邵阳", "益阳娄底", "怀化", "郴州", "永州", "湘西", "张家界"],
                                                ["广州", "深圳", "珠海", "汕头", "东莞", "中山", "佛山", "韶关", "江门", "湛", "茂名", "肇庆", "惠州", "梅州",
                                                    "汕尾", "河源", "阳江", "清远", "潮州", "揭阳", "云浮"
                                                ],
                                                ["南宁", "柳", "桂林", "梧州", "北海", "防城港", "钦州", "贵港", "玉林", "南宁地区", "柳州地区", "贺州", "百色",
                                                "河池"],
                                                ["海口", "三亚"],
                                                ["都", "绵阳", "德阳", "自贡", "攀枝花", "广元", "内江", "乐山", "南充", "宜宾", "广安", "达川", "雅安", "眉山",
                                                    "甘孜", "凉山", "泸州"
                                                ],
                                                ["贵阳", "六盘水", "遵义", "安顺", "铜仁", "黔西南毕节", "黔东南", "黔南"],
                                                ["昆明", "大理", "曲靖", "玉溪", "昭通", "楚雄", "红河", "文山", "思茅", "西双版纳", "保山", "德宏", "丽江", "江",
                                                    "迪庆", "临沧"
                                                ],
                                                ["拉萨", "日喀则", "山南", "林芝", "昌都", "阿里", "曲"],
                                                ["西安", "宝鸡", "咸阳", "铜川", "渭南", "延安", "榆林", "汉中", "安康", "商洛"],
                                                ["兰", "嘉峪关", "金昌", "白银", "天水", "酒泉", "张掖", "武威", "定西", "陇南", "平凉", "庆阳", "临夏", "甘"],
                                                ["银川", "石嘴山", "吴忠", "固原"],
                                                ["西宁", "海东", "海南", "海北", "黄南", "玉树", "果洛", "海西"],
                                                ["乌鲁木齐", "石河子", "克玛依", "伊犁", "巴音郭勒", "昌吉", "克孜勒苏柯尔克孜", "博尔塔拉", "吐鲁", "哈密", "喀什", "和田",
                                                    "阿克苏"
                                                ],
                                                ["香港特别行政区"],
                                                ["澳门特别行政区"],
                                                ["台北", "高雄", "台中", "台南", "屏东", "南投", "云林", "新竹", "彰化", "苗栗", "嘉义", "莲", "桃园", "宜兰",
                                                    "基隆", "台东", "金门", "马祖", "澎湖"
                                                ]
                                ]
                            city.currentIndex=0;
                            //cityModel=citys[currentIndex]
                            city.model=citys[currentIndex]
                           // console.log(city.model.get(0))
                        }
                    }
                    ComboBox{
                        id:city
                        //anchors.top: headRec.bottom
                        anchors.leftMargin: 5
                        anchors.verticalCenter: parent.verticalCenter
                        model:["东城", "西城", "崇文", "宣武", "朝阳", "丰台", "石景山", "海淀", "门头沟", "房山", "通州", "顺义", "昌平", "大兴",
                            "平谷", "怀柔", "密云", "延庆"
                        ]
                        width: 150
                        height: 30
                        anchors.left: province.right
                    }
                }
                Rectangle{
                    id:sickRec
                    width: 345
                    height: 40

                        Text{
                            id:isSick
                            text: "是否染病"
                            anchors.verticalCenter: sickRec.verticalCenter
                            font{
                                family: "Microsoft YaHei"
                                pixelSize: 14
                            }
                        }
                        RadioButton{
                            id:but1
                            anchors.left: isSick.right
                            anchors.leftMargin: 15
                            text: "是";anchors.verticalCenter: sickRec.verticalCenter
                        }
                        RadioButton{
                            id:but2
                            anchors.left: but1.right
                            anchors.leftMargin: 15
                            text: "否";anchors.verticalCenter: sickRec.verticalCenter
                        }
                        RadioButton{
                            id:but3
                            anchors.left: but2.right
                            anchors.leftMargin: 15
                            text: "未知";anchors.verticalCenter: sickRec.verticalCenter
                        }


                }
                Rectangle{
                    id:fixedRec
                    width: 345
                    height: 40
                    Text {
                        id: isFixed
                        text: qsTr("是否定点养蜂")
                        font{
                            family: "Microsoft YaHei"
                            pixelSize: 14
                        }
                        anchors.verticalCenter: fixedRec.verticalCenter
                    }
                    RadioButton{
                        id:but4
                        text: "是"
                        anchors.left: isFixed.right
                        anchors.leftMargin: 15
                        anchors.verticalCenter: fixedRec.verticalCenter
                    }
                    RadioButton{
                        id:but5
                        text:"否"
                        anchors.left: but4.right
                        anchors.leftMargin: 15
                        anchors.verticalCenter: fixedRec.verticalCenter
                    }
                }
                Rectangle{
                    width: 345
                    height: 30
                    color: "#3366ff"
                    Text {
                        id: submit
                        text: qsTr("提 交")
                        width: 20
                        height: 20
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font{
                                                        family: "Microsoft YaHei"
                                                        pixelSize: 18
                                                    }
                    }
                    TapHandler{
                        onTapped: {console.log("click submit");
                        collectInfor.destroy()}
                    }
                }

            }



        }
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
        onLoginChange:  function(userName,userPass){
            //loginPage.visible = false
            tabBar.visible=true
            loginPage.destroy()
            //var comMainPage = Qt.createComponent("MainPage.qml").createObject(faWindow,{width:faWindow.width, height:faWindow.height})
        //sharingLogo.visible=false
            sharingLogo.destroy()
            collectInfor.visible=true
            swipeView.visible=true

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


    SwipeView{
        id:swipeView
        visible: false
        width: parent.width
        currentIndex: tabBar.currentIndex
        Home{
            id:home
            height: faWindow.height-tabBar.height
            width: faWindow.width
        }
        Warning{
            id:warning
            height: faWindow.height-tabBar.height
            width: faWindow.width
        }
        Diagnosis{
            id:diagnosis
            height: faWindow.height-tabBar.height
            width: faWindow.width
        }

    }

    footer: TabBar{
        id:tabBar
        width: parent.width
        height: 40
        visible: false
        TabButton{text: qsTr("首页");height: parent.height;anchors.bottom: parent.bottom}

    TabButton{text: qsTr("预警");height: parent.height;anchors.bottom: parent.bottom}
    TabButton{text: qsTr("诊断");height: parent.height;anchors.bottom: parent.bottom}
    TabButton{text: qsTr("我的");height: parent.height;anchors.bottom: parent.bottom}
}









}
