class Request < ApplicationRecord
  belongs_to :user

  after_initialize :set_initial_approval

  def set_initial_approval
    self.approval ||= '承認待ち'
  end

  def approve!
    self.update(approval: '承認済み')
  end

  def reject!
    self.update(approval: '拒否済み')
  end
end
