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

signals:
    void titleAvailable(QString title);
    void albumAvailable(QString album);
    void artistAvailable(QString artist);

public slots:
    void requestData(QVariant fileUrl);
    QString sendTitle();
private:
    QMediaPlayer temp;
};

