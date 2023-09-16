class User < ApplicationRecord
    # パスワードと、パスワード確認の属性が追加される
    # password, password_confirmation
    # ただしDBカラムとしてではなく、メモリに格納される
    has_secure_password

    # presence: 必須項目であることを示す uniqueness: 
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    has_many :tasks

end
