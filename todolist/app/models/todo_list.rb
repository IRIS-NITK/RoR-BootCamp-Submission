class TodoList < ApplicationRecord

  belongs_to :user
  validates_presence_of :user
  has_many :users

  def completed?
    !completed_at.blank?
  end

  def completed_on_time?
    if completed?
      if completion_date.utc > completed_at.utc
        'Yes'
      else
        'No'
      end

    else
      'Not yet completed'
    end
  end
end