class User
    attr_accessor :name
end

user1 = User.new
user1.name = '太郎'
user2 = User.new
user2.name = '花子'
user3 = User.new
user3.name = '二郎'

users = [user1, user2, user3]

names = users.map(&:name)
puts names