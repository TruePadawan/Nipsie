import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id: root
    width: 430
    height: 70

    Rectangle {
        id: rootRect
        width: 0
        color: "#272121"
        border.color: "#a17373"
        anchors.fill: parent


        Column {
            id: column
            anchors.fill: parent

            Rectangle {
                id: barRect
                width: column.width
                height: 22
                border.color: "#ffffff"
                border.width: 0
                gradient: Gradient {
                    GradientStop {
                        position: 0.5
                        color: "#c6ffdd"
                    }
                }

                Row {
                    id: volumeAndSeekRow
                    anchors.fill: parent
                    rightPadding: 0
                    leftPadding: 10
                    spacing: 30

                    Slider {
                        id: seekSlider
                        width: volumeAndSeekRow.width * 0.6
                        height: volumeAndSeekRow.height * 0.25
                        anchors.verticalCenter: parent.verticalCenter
                        enabled: true
                        value: 0.5
                        handle: Rectangle {
                            visible: false
                        }

                        background: Rectangle {
                            color: "#bdbebf"

                            Rectangle {
                                width: seekSlider.visualPosition * parent.width
                                height: parent.height
                                color: "green"
                                radius: 2
                            }
                        }


                    }

                    Row {
                        id: volumeRow
                        width: volumeAndSeekRow.width * 0.3
                        height: seekSlider.height + 10
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 10

                        Button {
                            id: button
                            width: 16
                            height: 16
                            text: ""
                            background: Rectangle {
                                color: "transparent"
                            }

                            Image {
                                source: "qrc:/resources/volume.png"
                                width: 16
                                height: 16
                                sourceSize.width: 16
                                sourceSize.height: 16
                                anchors.centerIn: parent
                            }
                        }

                        Slider {
                            id: volumeSlider
                            width: 103
                            height: volumeAndSeekRow.height * 0.25
                            anchors.verticalCenter: parent.verticalCenter
                            enabled: true
                            value: 0.5
                            handle: Rectangle {
                                visible: false
                            }

                            background: Rectangle {
                                color: "#bdbebf"

                                Rectangle {
                                    width: volumeSlider.visualPosition * parent.width
                                    height: parent.height
                                    color: "green"
                                    radius: 2
                                }
                            }


                        }
                    }
                }
            }

            Rectangle {
                id: controlsRect
                width: column.width
                height: column.height - barRect.height
                color: "#dcd2d2"
                border.color: "#ffffff"
                border.width: 0
                gradient: Gradient {
                    GradientStop {
                        position: 0.3
                        color: "#c6ffdd"
                    }

                    GradientStop {
                        position: 0.6
                        color: "#fbd786"
                    }

                    GradientStop {
                        position: 1.0
                        color: "#f7797d"
                    }
                }

                Row {
                    id: controlsRow
                    width: column.width
                    height: controlsRect.height

                    Button {
                        id: playButton
                        width: 50
                        height: controlsRect.height
                        background: Rectangle {
                            color: "transparent"
                            border.width: 1
                            border.color: "#ffffff"

                        }

                        Image {
                            source: "qrc:/resources/play.png"
                            width: 16
                            height: 16
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.centerIn: parent
                        }

                    }

                    Button {
                        id: stopButton
                        width: 50
                        height: controlsRect.height
                        text: qsTr("")
                        background: Rectangle {
                            color: "transparent"
                            border.width: 1
                            border.color: "#ffffff"
                        }

                        Image {
                            source: "resources/stop.png"
                            width: 16
                            height: 16
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.centerIn: parent
                        }
                    }

                    Button {
                        id: seekBack
                        width: 50
                        height: controlsRect.height
                        text: qsTr("")
                        background: Rectangle {
                            color: "transparent"
                            border.width: 1
                            border.color: "#ffffff"
                        }

                        Image {
                            source: "qrc:/resources/seek_back.png"
                            width: 16
                            height: 16
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.centerIn: parent
                        }
                    }

                    Button {
                        id: seekFront
                        width: 50
                        height: controlsRect.height
                        text: qsTr("")
                        background: Rectangle {
                            color: "transparent"
                            border.width: 1
                            border.color: "#ffffff"
                        }

                        Image {
                            source: "qrc:/resources/seek_forward.png"
                            width: 16
                            height: 16
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.centerIn: parent
                        }
                    }

                    Button {
                        id: open_file
                        width: 50
                        height: controlsRect.height
                        text: qsTr("")
                        background: Rectangle {
                            color: "transparent"
                            border.width: 1
                            border.color: "#ffffff"
                        }

                        Image {
                            source: "qrc:/resources/open_file.png"
                            width: 16
                            height: 16
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle {
                        id: duration
                        width: 130
                        height: controlsRect.height
                        color: "#00000000"
                        border.width: 1
                        border.color: "#ffffff"

                        Row {
                            id: timeFrame
                            width: currentTimeFrame.width + seperator.width + totalTimeFrame.width + 4
                            height: duration.height * 0.25
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 2
                            anchors.horizontalCenter: parent.horizontalCenter

                            Label {
                                id: currentTimeFrame
                                text: qsTr("00:00")
                            }

                            Label {
                                id: seperator
                                text: qsTr("/")
                            }

                            Label {
                                id: totalTimeFrame
                                text: qsTr("00:00")
                            }
                        }
                    }

                    Button {
                        id: playList
                        width: 50
                        height: controlsRect.height
                        text: qsTr("")
                        background: Rectangle {
                            color: "transparent"
                            border.width: 1
                            border.color: "#ffffff"
                        }

                        Image {
                            source: "qrc:/resources/playlist.png"
                            width: 16
                            height: 16
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.centerIn: parent
                        }
                    }

                }
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:6}
}
##^##*/
