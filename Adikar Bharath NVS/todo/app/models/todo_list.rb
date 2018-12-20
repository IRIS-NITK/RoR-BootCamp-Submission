class TodoList < ApplicationRecord

  belongs_to :user
  validates_presence_of :user

  def completed?
    !completed_at.blank?
  end

  def completed_on_time?
    if completed?
      completion_date.utc > completed_at.utc ? 'Yes' : 'No'
    else
      'Not yet completed'
    end

  end
end
