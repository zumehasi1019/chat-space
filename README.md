== README



Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|message_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :group
- belongs_to :user


## messageテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|body|text|null: false, foreign_key: true|
|image|string|null: false, foreign_key: true|


### Association
- belongs_to :group
- belongs_to :user


## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index:true, unique: true|
|group_id|integer|null: false, foreign_key: true|

###Association
- belongs_to :group
- has_many : group, through : user_group
- has_many : message

## user_groupテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, index:true, unique: true|
|group_id|integer|null: false, foreign_key: true|

###Association
- belongs_to :group
- belongs_to :user

## groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index:true, unique: true|
|user_id|integer|null: false, foreign_key: true|

###Association
- belongs_to :user
- has_many : user, through : user_group
- has_many : message

