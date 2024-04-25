import router from '@ohos.router';

export function onJumpClick(src: string): void {
  router.pushUrl({
    url: src
  }, router.RouterMode.Standard, (err) => {
    if (err) {
      console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
      return;
    }
    console.info('Invoke pushUrl succeeded.');
  })
};

export function onBackClick(): void {
  router.back()
}