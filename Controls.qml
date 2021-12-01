import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id: root
    width: 430
    height: 70
    property alias audioIcon: audioIcon
    property alias seekSlider: seekSlider
    property alias volumeSlider: volumeSlider
    property alias seekFront: seekFront
    property alias seekBack: seekBack
    property alias stopButton: stopButton
    property alias playButton: playButton
    property alias playButtonIcon: playButtonIcon
    property alias playList: playList
    property alias open_file: open_file

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
                        color: "#a8edea"
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
                                id: audioIcon
                                source: "qrc:/resources/volume.png"
                                width: 16
                                height: 16
                                sourceSize.width: 16
                                sourceSize.height: 16
                                anchors.centerIn: parent

                                states: [
                                    State {
                                        name: "muted"
                                        PropertyChanges {
                                            target: audioIcon
                                            source: "qrc:/resources/muted.png"
                                        }
                                    }
                                ]
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
                        position: 0
                        color: "#a8edea"
                    }

                    GradientStop {
                        position: 1
                        color: "#fed6e3"
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
                            border.color: parent.down ? "yellow" : "#ffffff"
                        }

                        Image {
                            id: playButtonIcon
                            source: "qrc:/resources/play.png"
                            width: 16
                            height: 16
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.centerIn: parent

                            states: [
                                State {
                                    name: "paused"
                                    PropertyChanges {
                                        target: playButtonIcon
                                        source: "qrc:/resources/pause.png"
                                    }
                                }

                            ]
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
                            border.color: parent.down ? "yellow" : "#ffffff"
                        }

                        Image {
                            id: stopButtonIcon
                            source: "resources/stop.png"
                            width: 16
                            height: 16
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.centerIn: parent

                            states: [
                                State {
                                    name: "active"
                                    PropertyChanges {
                                        target: stopButtonIcon
                                        source: "qrc:/resources/stop_active.png"
                                    }
                                }
                            ]
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
                            border.color: parent.down ? "yellow" : "#ffffff"
                        }

                        Image {
                            id: seekBackIcon
                            source: "qrc:/resources/seek_back.png"
                            width: 16
                            height: 16
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.centerIn: parent

                            states: [
                                State {
                                    name: "active"
                                    PropertyChanges {
                                        target: seekBackIcon
                                        source: "qrc:/resources/seek_back_active.png"
                                    }
                                }
                            ]
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
                            border.color: parent.down ? "yellow" : "#ffffff"
                        }

                        Image {
                            id: seekFrontIcon
                            source: "qrc:/resources/seek_forward.png"
                            width: 16
                            height: 16
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.centerIn: parent

                            states: [
                                State {
                                    name: "active"
                                    PropertyChanges {
                                        target: seekFrontIcon
                                        source: "qrc:/resources/seek_forward_active.png"
                                    }
                                }
                            ]
                        }
                    }

                    Button {
                        id: open_file
                        width: 50
                        height: controlsRect.height
                        background: Rectangle {
                            color: "transparent"
                            border.width: 1
                            border.color: parent.down ? "yellow" : "#ffffff"
                        }
                        Image {
                            id: open_fileIcon
                            source: "qrc:/resources/open_file.png"
                            width: 16
                            height: 16
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.centerIn: parent

                            states: [
                                State {
                                    name: "active"
                                    PropertyChanges {
                                        target: open_fileIcon
                                        source: "qrc:/resources/open_file_active.png"
                                    }
                                }
                            ]
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
                            border.color: parent.down ? "yellow" : "#ffffff"
                        }

                        Image {
                            id: playListIcon
                            source: "qrc:/resources/playlist.png"
                            width: 16
                            height: 16
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.centerIn: parent

                            states: [
                                State {
                                    name: "active"
                                    PropertyChanges {
                                        target: playListIcon
                                        source: "qrc:/resources/playlist_active.png"
                                    }
                                }
                            ]
                        }
                    }

                }
            }
        }

    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
