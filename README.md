# GBShop
## iOS application created with swift

## Vapor Server
Install: brew install vapor
Open: vapor Xcode
Run from Xcode: Cmd + R
Stop when something wrong: lsof -i :8080 -sTCP:LISTEN | awk 'NR > 1 { print $2 }'| xargs kill -15
