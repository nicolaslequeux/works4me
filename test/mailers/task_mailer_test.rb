require 'test_helper'

class TaskMailerTest < ActionMailer::TestCase
  test "task_accepted_email" do
    mail = TaskMailer.task_accepted_email
    assert_equal "Task accepted email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
