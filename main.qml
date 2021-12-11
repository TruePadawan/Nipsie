import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.3
import QtMultimedia 5.15

import "helpers.js" as Functions;

ApplicationWindow {
    id: rootWindow
    width: 430
    height: 150
    maximumWidth: 430
    maximumHeight: 150

    visible: true
    title: qsTr("Nipsie")

    property var playlistItems: [];

    // PLAYLIST FEATURE
    Component {
        id: playListComponent

        CustomPlaylist {
            playlistModel: playlist
            currentFile: audioDevice.source
            addCurrent.onClicked: {
                // MAKE SURE THE ITEM TO BE ADDED ISN'T ALREADY IN THE PLAYLIST
                if (playlistItems.indexOf(audioDevice.source.toString()) == -1 && audioDevice.source != "")
                {
                    playlist.addItem(audioDevice.source)
                    playlist.itemSource(1)
                }
            }
            addOther.onClicked: {
                playlistFileDialog.open();
            }
        }
    }

    FileDialog {
        id: playlistFileDialog
        title: "Choose a music file to add to playlist"
        folder: shortcuts.music
        nameFilters: ["Music files (*.mp3)"]
        selectMultiple: true
        onAccepted: {
            // PREVENT DUPLICATES IN PLAYLIST WHEN ADDING MULTIPLE ITEMS
            for (let i = 0; i < fileUrls.length; ++i)
            {
                if (playlistItems.indexOf(fileUrls[i].toString()) === -1)
                {
                    playlist.addItem(fileUrls[i].toString());
                }
            }
        }
    }

    Playlist {
        id: playlist
        onItemCountChanged: {
            Functions.updatePlaylistItems(playlist,playlistItems);
            console.log("##",playlistItems);
        }
    }

    //////////// END OF PLAYLIST FEATURE ///////////////
    //////////// AUDIO DEVICE ////////////
    Audio {
        id: audioDevice
        autoPlay: true
        source: fileDialog.fileUrl
        volume: controls.volumeSlider.value

        onSourceChanged: {
            backend.requestData(audioDevice.source);
        }

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

    // FILE DIALOG FOR PICKING AUDIO FILE
    FileDialog {
        id: fileDialog
        title: "Please choose a music file"
        folder: shortcuts.music
        nameFilters: [ "Music files (*.mp3)" ]
        selectMultiple: false
    }

    // USER INTERFACE
    Column {
        anchors.fill: parent

        FileInfo {
            id: fileInfo
        }

        Controls {
            id: controls

            property var playListControl: undefined

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

            playList.onClicked: {
                if (playListControl == undefined)
                {
                    playListControl = playListComponent.createObject(rootWindow);

                    playListControl.show();
                    playListControl.x = 650+playListControl.width;
                    playListControl.y += 100;
                }
                else
                {
                    playListControl.hide();
                    controls.playListControl = undefined;
                }
            }

        }
    }

    // GET MUSIC FILE METADATA
    Connections {
        target: backend

        function onNoMetaData()
        {
            fileInfo.title.text = backend.getFileName(audioDevice.source);
        }

        function onTitleAvailable (title)
        {
            fileInfo.title.text = title;
        }

        function onAlbumAvailable (album)
        {
            fileInfo.album.text = album;
        }

        function onArtistAvailable (artist)
        {
            fileInfo.artist.text = artist;
        }

        function onThumbnailAvailable (source)
        {
            fileInfo.thumbnail.source = source;
        }
    }
}
