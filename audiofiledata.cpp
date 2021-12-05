#include "audiofiledata.h"
#include <QUrl>

AudioFileData::AudioFileData(QObject *parent) : QObject(parent)
{
    connect(&temp,&QMediaPlayer::mediaStatusChanged, this, [=] (QMediaPlayer::MediaStatus status){
        if (status == QMediaPlayer::LoadedMedia)
        {
            if (temp.isMetaDataAvailable())
            {
                qDebug() << "Title Available";
                emit titleAvailable(temp.metaData(QMediaMetaData::Title).toString());
                emit albumAvailable(temp.metaData(QMediaMetaData::AlbumTitle).toString());
                emit artistAvailable(temp.metaData(QMediaMetaData::AlbumArtist).toString());
            }
        }
    });

}

void AudioFileData::requestData(QVariant file)
{
    temp.setMedia(QUrl{file.toString()});
}

QString AudioFileData::sendTitle()
{
    return temp.metaData(QMediaMetaData::Title).toString();
}
