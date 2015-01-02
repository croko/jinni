class AddReportToPhoto < ActiveRecord::Migration
  def change
    add_reference :photos, :report, index: true
  end
end
