# Local Apps

Local Apps is a chrome extension for local development storing information
about local applications and servers. It provides a dashboard of your local
applications and servers and their online status.

## Build and usage

To create a build of Local Apps follow these steps:

```shell
npm install
bower install
grunt build
```

Then the extension is created in the `dist/` folder.

To use it in Chrome, open [chrome://extensions/](chrome://extensions/). Then
check *Developer mode* and click *Load unpacked extension...* and select the
`dist/` folder. You can now find Local Apps in your Chrome applications. 