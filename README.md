# Paperclip dropbox 2016

rails new paperclip -d mysql

Add to gemfile 


gem "paperclip-dropbox", ">= 1.1.7"

run bundle

$ bundle

$ rails g scaffold User name password


$ rails g paperclip user avatar

$ rake dropbox:authorize APP_KEY=jk54u5er9omhvew APP_SECRET=yzbbg9v2547p280 ACCESS_TYPE=app_folder

result

access_token: 4a7sa71hem88am8l
access_token_secret: htfuufa8r23awsu
user_id: 369832843