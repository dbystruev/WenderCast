# WenderCast

Ray Wenderlich's Push Notifications project from [RayWenderlich.com](https://www.raywenderlich.com/11395893-push-notifications-tutorial-getting-started)

## Simulate Push Notification

```bash
xcrun simctl push booted co.getoutfit.raywenderlich.WenderCast WenderCast/first.apn
```

## Content of APN JSON

[WenderCast/first.apn](https://github.com/dbystruev/WenderCast/blob/main/WenderCast/first.apn)

```json
{
  "aps": {
    "alert": "Happy New Year!",
    "sound": "default",
    "link_url": "https://github.com/dbystruev"
  }
}
```

## Notification Screenshot

![Happy New Year notification](https://github.com/dbystruev/WenderCast/blob/main/WenderCast/notification.png?raw=true)
