import media from '@ohos.multimedia.media';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';

const TAG = 'PlayManager';

export default class PlayManager {
  public audioPlayer?: media.AVPlayer;

  init(context) {
    this.release();
    media.createAVPlayer((err, player: media.AVPlayer) => {
      if (player !== null) {
        this.audioPlayer = player;
        this.audioPlayer.on('timeUpdate', (time: number) => {
          context.loader = time;
        });
        this.audioPlayer.on('durationUpdate', (duration: number) => {
          context.total = duration;
        });
        this.audioPlayer.on('stateChange', async (state: media.AVPlayerState) => {
          switch (state.toString()) {
            case 'idle':
              Logger.info(TAG, `The AVPlayer state is: ${this.audioPlayer!.state}`);
              break;
            case 'initialized':
              Logger.info(TAG, `The AVPlayer state is: ${this.audioPlayer!.state}`);
              this.audioPlayer!.prepare((err) => {
                if (!err) {
                  Logger.info(TAG, `The AVPlayer prepare success`);
                } else {
                  Logger.info(TAG,
                    `The AVPlayer prepare failed, error: ${err.message}, state: ${this.audioPlayer!.state}`);
                }
              });
              break;
            case 'prepared':
              Logger.info(TAG, `The AVPlayer state is: ${this.audioPlayer!.state}`);
              this.audioPlayer!.play((err) => {
                if (!err) {
                  Logger.info(TAG, `The AVPlayer play success`);
                } else {
                  Logger.info(TAG, `The AVPlayer play failed, error: ${err.message}, state: ${this.audioPlayer!.state}`);
                }
              });
              break;
            case 'playing':
              Logger.info(TAG, `The AVPlayer state is: ${this.audioPlayer!.state}`);
              break;
            case 'paused':
              Logger.info(TAG, `The AVPlayer state is: ${this.audioPlayer!.state}`);
              break;
            case 'completed':
              Logger.info(TAG, `The AVPlayer state is: ${this.audioPlayer!.state}`);
              context.isCompleted = true;
              break;
            case 'stopped':
              Logger.info(TAG, `The AVPlayer state is: ${this.audioPlayer!.state}`);
              break;
            case 'released':
              Logger.info(TAG, `The AVPlayer state is: ${this.audioPlayer!.state}`);
              break;
            case 'error':
              Logger.info(TAG, `The AVPlayer state is: ${this.audioPlayer!.state}`);
              break;
            default:
              break;
          }
          Logger.info(TAG, `The AVPlayer state is changed to: ${this.audioPlayer!.state}`);
        });
        this.audioPlayer.on('error', (error) => {
          Logger.info(TAG, `The AVPlayer error, err code is: ${error.code}, err message is: ${error.message}`);
        });
        Logger.info(TAG, `create AVPlayer success`);
      } else {
        Logger.info(TAG, `create AVPlayer failed, error: ${err.message}`);
      }
    });
  }

  release() {
    if (this.audioPlayer !== undefined) {
      this.audioPlayer!.release((err) => {
        if (!err) {
          Logger.info(TAG, `release AVPlayer success`);
        } else {
          Logger.info(TAG, `release AVPlayer failed, error: ${err.message}`);
        }
      });
    } else {
      Logger.info(TAG, `No need to release AVPlayer`);
    }
  }

  play(filePath: string, isNewAudio: boolean = false) {
    if (!isNewAudio) {
      if (this.audioPlayer!.state === Const.IDLE) {
        this.audioPlayer!.url = filePath;
      } else {
        this.audioPlayer!.play((err) => {
          if (!err) {
            Logger.info(TAG, `AVPlayer play success`);
          } else {
            Logger.info(TAG, `AVPlayer play failed, error: ${err.message}`);
          }
        });
      }
    } else {
      this.audioPlayer!.reset((err) => {
        if (!err) {
          Logger.info(TAG, `AVPlayer reset success`);
          this.audioPlayer!.url = filePath;
        } else {
          Logger.info(TAG, `AVPlayer reset failed, error: ${err.message}`);
        }
      });
    }
  }

  pause() {
    if (this.audioPlayer!.state === Const.PLAYING) {
      this.audioPlayer!.pause((err) => {
        if (!err) {
          Logger.info(TAG, `AVPlayer pause success`);
        } else {
          Logger.info(TAG, `AVPlayer pause failed, error: ${err.message}`);
        }
      });
    } else {
      Logger.info(TAG, this.audioPlayer === undefined ?
        `No AVPlayer found`: `AVPlayer pause failed, current state is wrong, now is: ${this.audioPlayer!.state}`);
    }
  }

  duration(): number {
    return this.audioPlayer!.duration;
  }

  state(): media.AVPlayerState {
    return this.audioPlayer!.state;
  }
}