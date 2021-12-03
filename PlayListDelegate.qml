import QtQuick 2.0

Item {
    width: 295
    height: 20
    property alias audioFileName: audioFileName
    property alias duration: duration

    Row {
        id: row
        anchors.fill: parent
        spacing: 5

        Image {
            id: musicIcon
            width: 20
            height: 20
            source: "resources/music.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: audioFileName
            text: qsTr("audio")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
        }

        Text {
            id: duration
            text: qsTr("00:00")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            font.pixelSize: 12
            anchors.rightMargin: 10
        }
    }
}
