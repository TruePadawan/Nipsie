#pragma once

#include <QObject>
#include <QFileInfo>
#include <QMediaMetaData>
#include <QMediaPlayer>
#include <QVariant>

class AudioFileData : public QObject
{
    Q_OBJECT
public:
    explicit AudioFileData(QObject *parent = nullptr);
    void serializeImgToString();

signals:
    void titleAvailable(QString title);
    void albumAvailable(QString album);
    void artistAvailable(QString artist);
    void thumbnailAvailable(QString imageData);
    void noMetaData();

public slots:
    void requestData(QVariant fileUrl);
    QString getFileName(QVariant sourceUrl);
private:
    QMediaPlayer temp;
    QString imgData;
};

