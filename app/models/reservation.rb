class Reservation < ActiveRecord::Base
		validates_presence_of :check_in_date
		validates_presence_of :check_out_date
		validates_presence_of :guest

		belongs_to :user
		belongs_to :listing

end
