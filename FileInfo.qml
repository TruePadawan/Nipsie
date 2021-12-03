import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id: root
    width: 430
    height: 80
    property alias shuffleButtonIcon: shuffleButtonIcon
    property alias shuffleButton: shuffleButton
    property alias repeatButtonIcon: repeatButtonIcon
    property alias repeatButton: repeatButton

    Rectangle {
        id: backgroundRect
        color: "#a8edea"
        anchors.fill: parent

        Row {
            id: row
            anchors.fill: parent

            Rectangle {
                id: audioImage
                width: backgroundRect.width * 0.3
                height: backgroundRect.height
                color: "#ffecd2"
                border.color: "#ffff00"
                border.width: 1

                Rectangle {
                    id: fillerRect
                    x: 7
                    y: 4
                    width: 116
                    height: 72
                    color: "#ffecd2"
                    border.width: 0
                }

                Image {
                    id: image
                    x: 7
                    y: 4
                    width: 116
                    height: 72
                    source: ""
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                id: audioInfo
                width: backgroundRect.width * 0.4
                height: backgroundRect.height
                color: "#ffecd2"
                border.color: "#ffff00"
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#ffecd2"
                    }

                    GradientStop {
                        position: 1
                        color: "#fcb69f"
                    }
                }

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
                color: "#ffecd2"
                border.color: "#ffff00"
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#ffecd2"
                    }

                    GradientStop {
                        position: 1
                        color: "#fcb69f"
                    }
                }

                Rectangle {
                    id: extraBackground
                    width: 65
                    height: 20
                    color: "#a1c4fd"
                    radius: 5
                    anchors.verticalCenter: parent.verticalCenter
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#f3e7e9"
                        }

                        GradientStop {
                            position: 0.99
                            color: "#e3eeff"
                        }

                        GradientStop {
                            position: 1
                            color: "#e3eeff"
                        }
                    }
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
                                id: repeatButtonIcon
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
                                id: shuffleButtonIcon
                                source: "qrc:/resources/shuffle.png"
                                fillMode: Image.PreserveAspectFit
                                width: 32
                                height: 20
                                sourceSize.width: 32
                                sourceSize.height: 32
                                anchors.centerIn: parent

                                states: [
                                    State {
                                        name: "active"
                                        PropertyChanges {
                                            target: shuffleButtonIcon
                                            source: "qrc:/resources/shuffle_clicked.png"
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

}
