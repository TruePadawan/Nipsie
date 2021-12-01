import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.3
import QtMultimedia 5.15

import "helpers.js" as Functions;

Window {
    width: 430
    height: 150
    maximumWidth: 430
    maximumHeight: 150

    visible: true
    title: qsTr("Nipsie")

    Audio {
        id: audioDevice
        autoPlay: true
        source: fileDialog.fileUrl
        volume: controls.volumeSlider.value

        onPositionChanged: {
            controls.currentTimeFrame.text = Functions.numToTime(position/1000);
        }

        onDurationChanged: {
            controls.totalTimeFrame.text = Functions.numToTime(audioDevice.duration/1000)
        }

        onPlaying: {
            controls.playButtonIcon.state = "paused"
        }
        onPaused: {
            controls.playButtonIcon.state = ""
        }
        onStopped: {
            controls.playButtonIcon.state = ""
        }

        onVolumeChanged: {
                controls.audioIcon.state = (volume === 0) ? "muted" : ""
        }
    }

    FileDialog {
        id: fileDialog
        title: "Please choose an audio file"
        folder: shortcuts.music
        nameFilters: [ "Audio files (*.mp3 *.wav)" ]
        selectMultiple: false

        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrl)
        }
    }

    // USER INTERFACE
    Column {
        anchors.fill: parent

        FileInfo {
            id: fileInfo
        }

        Controls {
            id: controls

            open_file.onClicked: {
                fileDialog.open();
            }
            playButton.onClicked: {
                if (audioDevice.playbackState === Audio.PausedState || audioDevice.playbackState === Audio.StoppedState)
                {
                    audioDevice.play();
                }else
                {
                    audioDevice.pause();
                }
            }
            stopButton.onClicked: {
                if (audioDevice.playbackState === Audio.PlayingState || audioDevice.playbackState === Audio.PausedState)
                {
                    audioDevice.stop();
                }
            }

            seekSlider.to: audioDevice.duration/1000
            seekSlider.value: audioDevice.position/1000
            seekSlider.onMoved: {
                audioDevice.seek(seekSlider.value * 1000);
            }


        }
    }
}
