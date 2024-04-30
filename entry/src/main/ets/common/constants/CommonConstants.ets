export class CommonConstants {
  /**
   * 组件尺寸
   */
  static readonly SWIPER_DEFAULT_WIDTH: string = '66%';
  static readonly FULL_PERCENT: string = '100%';
  static readonly HALF_PERCENT: string = '50%';
  static readonly IMAGE_CONTAINER_HEIGHT: string = '42%';
  static readonly ICON_SIZE: string = '30';
  static readonly LIST_ICON_SIZE: string = '20';
  static readonly BAR_WEIGHT: string = '25%';
  static readonly BAR_HEIGHT: string = '10%';
  static readonly CONTENT_WIDTH_PERCENT: string = '87%';
  static readonly SEARCHBAR_WIDTH: string = '91.1%'
  static readonly IMAGE_HEIGHT_MIN: string = '78%';

  /**
   * 组件常数
   */
  static readonly OPACITY: number = 0.6;
  static readonly BORDER_WIDTH: number = 0.5;

  /**
   * Splash Title text.
   */
  static readonly SPLASH_DES: string = 'Personal Voice Agency';
  static readonly SPLASH_WELCOME: string = 'PVA欢迎您';

  /**
   * splash时间常数
   */
  static readonly COUNTDOWN: number = 5;
  static readonly TRANSITION_DURATION: number = 600;
  static readonly DURATION: number = 1000;
  static readonly MORNING_TIME: number = 6;
  static readonly EVENING_TIME: number = 18;
  static readonly NIGHT_TIME: number = 19;
  static readonly SPLASH_DURATION: number = 3000;

  /**
   * 计时器时间常数
   */
  static readonly TIME_10: number = 10;
  static readonly TIME_60: number = 60;
  static readonly TIME_1000: number = 1000;
  static readonly TIME_3600: number = 3600;
  static readonly TIME_60000: number = 60000;
  static readonly NUMBER_2: number = 2;
  static readonly NUMBER_3: number = 3;
  static readonly STRING_0: string = '0';
  static readonly STRING_SLASH: string = '/';
  static readonly STRING_COLON: string = ':';
  static readonly STRING_COLON_0: string = ':0';
  static readonly STRING_TIME: string = '00:00:00';

  /**
   * State of player or recorder. 播放器和录音器状态
   */
  static readonly IDLE: string = 'idle';
  static readonly INITIALIZED: string = 'initialized';
  static readonly PREPARED: string = 'prepared';
  static readonly PLAYING: string = 'playing';
  static readonly PAUSED: string = 'paused';
  static readonly COMPLETED: string = 'completed';
  static readonly STARTED: string = 'started';
  static readonly STOPPED: string = 'stopped';
  static readonly RELEASED: string = 'released';
  static readonly ERROR: string = 'error';

  /**
   * Config of recorder. 录音器参数
   */
  static readonly BIT_RATE: number = 48000;
  static readonly CHANNEL: number = 2;
  static readonly SAMPLE_RATE: number = 48000;
  static readonly LATITUDE: number = 30;
  static readonly LONGITUDE: number = 130;

  /**
   * Color constants.
   */
  static readonly TRANSPARENT_COLOR: string = '#00ffffff';
  static readonly NAVIGATION_BAR_COLOR: string = '#00ff00';
  static readonly STATUS_BAR_CONTENT_COLOR: string = '#ffffff';
  static readonly NAVIGATION_BAR_CONTENT_COLOR: string = '#ffffff';
  static readonly THEME_COLOR: string = '#c82424';
}

/**
 * 上传下载请求
 */
export class NetworkConstants {
  static readonly URL: String = 'http://192.168.31.70:5000';
}