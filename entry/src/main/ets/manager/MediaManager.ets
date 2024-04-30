import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import AudioData from '../common/model/AudioDataModel';
import Logger from '../common/utils/Logger';

const TAG = 'MediaManager';

class MediaManager {
  public mediaManager?: mediaLibrary.MediaLibrary;
  private publicPath?: string = '';

  constructor() {
    this.init();
  }

  async init() {
    let context = getContext(this);
    this.mediaManager = mediaLibrary.getMediaLibrary(context);
    this.publicPath = await this.mediaManager.getPublicDirectory(mediaLibrary.DirectoryType.DIR_AUDIO);
    Logger.info(TAG, `Init finished, public path is: ${this.publicPath.toString()}`);
  }

  async createAudioFile() {
    let timeStamp = new Date().getTime().toString();
    let fileName = timeStamp + '.m4a';
    Logger.info(TAG, `Create audio file finished, file name is: ${fileName}, `);
    this.publicPath = await this.mediaManager?.getPublicDirectory(mediaLibrary?.DirectoryType.DIR_AUDIO);
    return this.mediaManager?.createAsset(mediaLibrary?.MediaType.AUDIO, fileName, this.publicPath!);
  }

  async query() {
    if (this.mediaManager === undefined) {
      Logger.info(TAG, `Query failed, no mediaManager found`);
    } else {
      Logger.info(TAG, `Query begin, mediaManager is: ${JSON.stringify(this.mediaManager)}`);
    }
    let audiosFetchOp: mediaLibrary.MediaFetchOptions = {
      selections: mediaLibrary.FileKey.MEDIA_TYPE + '= ?',
      selectionArgs: [mediaLibrary.MediaType.AUDIO.toString()]
    };
    const context = getContext(this);
    this.mediaManager = mediaLibrary.getMediaLibrary(context);
    let fetchResult = await this.mediaManager.getFileAssets(audiosFetchOp);
    let fileAssets = await fetchResult.getAllObject();
    if (fileAssets.length === 0) {
      Logger.info(TAG, `No audio file was found`);
    }
    let audioList: Array<AudioData> = [];
    for (let i = 0; i < fileAssets.length; i++) {
      let fileAsset = fileAssets[i];
      let audio: AudioData = {name: '', uri: '', size: 0, time: 0, duration: 0, height: '72vp'};
      let fdNumber = await fileAsset.open('r');
      let uri = `fd://${fdNumber.toString()}`;
      audio.name = fileAsset.displayName;
      audio.uri = uri;
      audio.size = fileAsset.size;
      audio.time = fileAsset.dateModified;
      audio.duration = fileAsset.duration;
      Logger.info(TAG, `The audio file information: ${JSON.stringify(audio)}`);
      audioList.push(audio);
    }
    Logger.info(TAG, `The audioList is: ${JSON.stringify(audioList)}`);
    return audioList;
  }
}

export default new MediaManager();
