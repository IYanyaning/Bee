#ifndef AUDIORECORDER_H
#define AUDIORECORDER_H
//#include <QAudioRecorder>
#include <QTextToSpeech>

class AudioRecorder : public QObject
{
public:
    AudioRecorder(){

        //tt.t
    }
private:
    QTextToSpeech tt;
};

#endif // AUDIORECORDER_H
