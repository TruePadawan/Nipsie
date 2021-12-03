import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12


Window {
    id: root
    width: 295
    height: 400
    maximumWidth: 295
    maximumHeight: 400
    title: "Playlist"
    flags: Qt.FramelessWindowHint

    Column {
        id: rootCol
        anchors.fill: parent

        Rectangle {
            id: header
            width: rootCol.width
            height: 30
            color: "#302e29"
            
            Text {
                id: playlistText
                color: "#ffffff"
                text: qsTr("Playlist")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MouseArea {
                id: dragWindow
                anchors.fill: parent
                onPressed: {
                    root.startSystemMove();
                }
            }
        }

        Rectangle {
            id: listViewBackground
            width: root.width
            height: 340
            color: "#ffecd2"
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

            ListView {
                id: listView
                anchors.fill: parent
                delegate: PlayListDelegate {}
//                model: ListModel {
//                    ListElement {
//                        name: "Grey"
//                        colorCode: "grey"
//                    }

//                    ListElement {
//                        name: "Red"
//                        colorCode: "red"
//                    }

//                    ListElement {
//                        name: "Blue"
//                        colorCode: "blue"
//                    }

//                    ListElement {
//                        name: "Green"
//                        colorCode: "green"
//                    }
//                }
            }
        }

        Rectangle {
            id: controls
            width: root.width
            height: 30
            color: "#302e29"
        }
    }

}
