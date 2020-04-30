#  Notification Types (3)

1. Push Notifications
2. Local Notifications
3. Silent Notifications



# 1. Push Notifications

* comes from a server
* very popular of interviewers to ask
* works with the Apple Push Notification Service (APNS)


# 2. Local Notifications

* comes from the app
* ex. Alarm Clock wakes you up ~4AM.


# 3. Silent Notifications

* comes from a server
* no UI attached


# Flowchart of Push Notifications

0. Three-legged infrastructure:
    * a. app
    * b. APNS
    * c. some server

1. App must request Permissions for Notifications from the user
    * 1-time occurrence
    * if the user rejects, the user MUST go into their settings to give permissions
    * for all types of notifications

2. App must request a token from the APNS
    * token identifies the specific phone/iPad

3. App will send this token to the server
    * eg. Firebase Push, UrbanAirship, BlueShift, your own team's server

4. Server can request to send a push notification to the app
    * send a payload of 3 items:
    * a. token for the device it wants to send to
    * b. a certificate (you, the developer, already set up on the server)
        * Apple Developer Portal - you, the developer, already registered the app for push notifications
    * c. push payload - picture, strings, etc
        * aa. Rich Notifications

5. APNS will send the push to the phone.

6. User receives the push along the top of the screen
    * if app is backgrounded or not running (wake up the app)
    * if the app is in the foreground
        * no message will appear on the top
        * you, the developer, are responsible for presenting pushes while the user is in the app
