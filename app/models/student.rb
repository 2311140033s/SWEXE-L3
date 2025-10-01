class Student < ApplicationRecord
  validates :student_number, presence: true,
                             format: { with: /\A\d{10}\z/, message: 'は10桁の数字である必要があります' }
  
  validate :student_number_special_rule

  validates :name, presence: { message: 'を入力してください' }
  
  validates :email, presence: { message: 'を入力してください' },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'の形式が正しくありません' }

  private

  def student_number_special_rule
    return if student_number.blank?
    
    # 3〜6桁目が1111〜1115のいずれかかチェック
    # 例：1231111456 → 1111が3〜6桁目
    
    check_str = student_number[2..5] # 3〜6桁目（0始まりだから2〜5）
    allowed = %w[1111 1112 1113 1114 1115]

    unless allowed.include?(check_str)
      errors.add(:student_number, 'の3〜6桁目は1111〜1115のいずれかである必要があります')
    end
  end
end
