class Task < ApplicationRecord
    before_validation :set_nameless_name # validationの前にこの処理を呼ぶ
    validates :name, presence: true
    validates :name, length: { maximum: 30 }
    validate :validate_name_not_including_comma

    private

    def validate_name_not_including_comma
      errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
    end

    # nameが無記入なら「名前なし」という値を入れる
    def set_nameless_name
      self.name = '名前なし' if name.blank?
    end

end
