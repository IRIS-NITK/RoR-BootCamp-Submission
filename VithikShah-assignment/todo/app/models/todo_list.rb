class TodoList < ApplicationRecord

  belongs_to :user
  validates_presence_of :user

  def completed?
    !completed_at.blank?
  end

  def completed_on_time?
        if completed?
          completion_date.strftime('%F') > completed_at.strftime('%F') ? 'Yes' : 'No'
        else
          'Not yet completed'
        end
  end

  def highlight?
  	 Time.now.strftime('%F') > completion_date.strftime('%F') ? true : false
  end
end

