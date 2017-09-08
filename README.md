== README



Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.



## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|body|text|null: false, foreign_key: true|
|image|string|null: false, foreign_key: true|


### Association
- belongs_to :group
- belongs_to :user


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index:true, unique: true|
|mail|string|null: false, index:true, unique: true|
|password|string|null: false|
|group_id|integer|null: false, foreign_key: true|

### Association
- has_many : group, through : user_group
- has_many : users_groups
- has_many : message

## users_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, index:true, unique: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- has_many :groups
- has_many :users

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index:true, unique: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many : users, through : users_groups
- has_many : users_groups
- has_many : messages

