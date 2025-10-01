require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = Student.create!(student_number: "1111123456", name: "優星", email: "yusei@example.com")
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference("Student.count", 1) do
      post students_url, params: {
        student: {
          student_number: "1111123457",
          name: "新しい名前",
          email: "new@example.com"
        }
      }
    end

    assert_redirected_to students_url
  end

  test "should update student" do
    patch student_url(@student), params: {
      student: {
        name: "更新された名前"
      }
    }
    assert_redirected_to students_url
    @student.reload
    assert_equal "更新された名前", @student.name
  end

  test "should destroy student" do
    assert_difference("Student.count", -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
