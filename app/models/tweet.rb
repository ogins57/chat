class Tweet < ActiveRecord::Base

    validates :user , :presence => true
    validates :tweet, :presence => true
end
