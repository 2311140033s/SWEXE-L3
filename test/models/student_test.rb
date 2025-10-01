require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test "valid student is valid" do
    student = Student.new(student_number: "1111123456", name: "優星", email: "yusei@example.com")
    assert student.valid?, "正しい情報でもバリデーションが通らなかった"
  end

  test "invalid student_number format" do
    student = Student.new(student_number: "abc", name: "優星", email: "yusei@example.com")
    assert_not student.valid?, "学籍番号が不正でも通ってしまった"
  end

  test "student_number pattern should include allowed prefix" do
    student = Student.new(student_number: "9999923456", name: "優星", email: "yusei@example.com")
    assert_not student.valid?, "許可されてない学籍番号のプレフィックスが通った"
  end

  test "invalid email format" do
    student = Student.new(student_number: "1111123456", name: "優星", email: "notanemail")
    assert_not student.valid?, "不正なメール形式が通ってしまった"
  end
end
