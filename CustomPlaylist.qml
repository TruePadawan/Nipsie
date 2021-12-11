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

    property var playlistModel: null
    property var currentFile: null

    property alias playPlaylist: playPlaylist
    property alias addOther: addOther
    property alias addCurrent: addCurrent

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
                delegate: PlayListDelegate {
                    audioFileName.text: backend.getFileName(source);
                }
                model: playlistModel
            }
        }

        Rectangle {
            id: controls
            width: root.width
            height: 30
            color: "#302e29"

            Row {
                id: row
                anchors.fill: parent
                spacing: 43
                rightPadding: 5
                leftPadding: 5
                topPadding: 0
                padding: 0


                Button {
                    id: addCurrent
                    width: 80
                    height: 16
                    text: qsTr("Add Current")
                    anchors.verticalCenter: parent.verticalCenter
                    background: Rectangle {
                        radius: 4;
                        color: parent.down ? "#cf6868" : "brown"
                    }
                }

                Button {
                    id: playPlaylist
                    width: 50
                    height: 16
                    text: qsTr("Play")
                    anchors.verticalCenter: parent.verticalCenter
                    background: Rectangle {
                        radius: 4;
                        color: parent.down ? "#cf6868" : "brown"
                    }
                }

                Button {
                    id: addOther
                    width: 70
                    height: 16
                    text: qsTr("Add Other")
                    anchors.verticalCenter: parent.verticalCenter
                    background: Rectangle {
                        radius: 4;
                        color: parent.down ? "#cf6868" : "brown"
                    }
                }
            }
        }
    }

}
