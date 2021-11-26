import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    width: 430
    height: 150
    visible: true
    title: qsTr("Nipsie")

    Column {
        anchors.fill: parent

        FileInfo {
            id: fileInfo
        }

        Controls {
            id: controls
        }
    }
}
