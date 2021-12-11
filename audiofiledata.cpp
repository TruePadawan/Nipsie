#include "audiofiledata.h"
#include <QUrl>
#include <QPixmap>
#include <QByteArray>
#include <QBuffer>

AudioFileData::AudioFileData(QObject *parent) : QObject(parent)
{


    connect(&temp,&QMediaPlayer::mediaStatusChanged, this, [=] (QMediaPlayer::MediaStatus status){
        if (status == QMediaPlayer::LoadedMedia)
        {
            if (temp.isMetaDataAvailable())
            {
                imgData = "data:image/jpg;base64,";
                emit titleAvailable(temp.metaData(QMediaMetaData::Title).toString());
                emit albumAvailable(temp.metaData(QMediaMetaData::AlbumTitle).toString());
                emit artistAvailable(temp.metaData(QMediaMetaData::AlbumArtist).toString());
                serializeImgToString();
                imgData = "";
            }else {
                emit noMetaData();
            }
        }
    });

}

void AudioFileData::serializeImgToString()
{
    auto img = temp.metaData(QMediaMetaData::ThumbnailImage).value<QPixmap>();

    if (!img.isNull())
    {
        QBuffer dataBuffer;
        dataBuffer.open(QIODevice::WriteOnly);
        img.save(&dataBuffer,"PNG");
        imgData.append(dataBuffer.buffer().toBase64().data());
        emit thumbnailAvailable(imgData);
    }
}

void AudioFileData::requestData(QVariant file)
{
    temp.setMedia(QUrl{file.toString()});
}

QString AudioFileData::getFileName(QVariant sourceUrl)
{
    QFileInfo fileData{sourceUrl.toString()};

    return fileData.completeBaseName();
}
