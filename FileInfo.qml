import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id: root
    width: 430
    height: 80

    Rectangle {
        id: backgroundRect
        color: "#c6ffdd"
        anchors.fill: parent
        //        gradient: Gradient {
        //            GradientStop {
        //                position: 0.4
        //                color: "#F1F109"
        //            }

        //            GradientStop {
        //                position: 1.0
        //                color: "#c6ffdd"
        //            }
        //        }

        Row {
            id: row
            anchors.fill: parent

            Rectangle {
                id: audioImage
                width: backgroundRect.width * 0.3
                height: backgroundRect.height
                color: "transparent"
                border.color: "#ffffff"

                Column {
                    id: column
                    width: audioImage.width * 0.9
                    height: audioImage.height * 0.9
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter


                    Rectangle {
                        id: rectangle
                        width: 116
                        height: 72
                        color: "#ffffff"
                    }
                    Image {
                        id: image
                        width: 116
                        height: 72
                        source: ""
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Rectangle {
                id: audioInfo
                width: backgroundRect.width * 0.4
                height: backgroundRect.height
                color: "transparent"
                border.color: "#ffffff"

                Column {
                    id: column1
                    anchors.fill: parent
                    padding: 10
                    spacing: 5

                    Label {
                        id: title
                        width: audioInfo.width * 0.9
                        height: 20
                        wrapMode: Text.Wrap
                    }

                    Label {
                        id: artist
                        width: audioInfo.width * 0.9
                        wrapMode: Text.Wrap
                    }

                    Label {
                        id: album
                        width: audioInfo.width * 0.9
                        wrapMode: Text.Wrap
                    }
                }
            }

            Rectangle {
                id: extraControls
                width: backgroundRect.width * 0.3
                height: backgroundRect.height
                color: "#e3ddcb"
                border.color: "#ffffff"

                Rectangle {
                    id: extraBackground
                    width: 65
                    height: 20
                    color: "#302e29"
                    radius: 0
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    Row {
                        id: extraRow
                        anchors.fill: parent

                        Button {
                            id: repeatButton
                            text: qsTr("")
                            width: parent.width * 0.5
                            height: extraRow.height
                            background: Rectangle {
                                color: "transparent"
                            }

                            Image {
                                source: "qrc:/resources/repeat.png"
                                fillMode: Image.PreserveAspectFit
                                width: 32
                                height: 20
                                sourceSize.width: 32
                                sourceSize.height: 32
                                anchors.centerIn: parent
                            }
                        }

                        Button {
                            id: shuffleButton
                            width: parent.width * 0.5
                            height: extraRow.height
                            text: qsTr("")
                            background: Rectangle {
                                color: "transparent"
                            }

                            Image {
                                source: "qrc:/resources/shuffle.png"
                                fillMode: Image.PreserveAspectFit
                                width: 32
                                height: 20
                                sourceSize.width: 32
                                sourceSize.height: 32
                                anchors.centerIn: parent
                            }
                        }



                    }
                }
            }
        }
    }
}
