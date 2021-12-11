import QtQuick 2.0

Item {
    id: root
    width: 295
    height: 20
    property alias audioFileName: audioFileName

    Rectangle {
        id: rectangle
        color: "#000000"
        anchors.fill: parent

        Row {
            id: row
            anchors.fill: parent
            spacing: 10

            Image {
                id: image
                width: 20
                height: 20
                source: "resources/music.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: audioFileName
                color: "#f9e96c"
                text: qsTr("audio.mp3")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }
        }
    }
    MouseArea {
        id: mousearea
        anchors.fill: parent
    }
}
