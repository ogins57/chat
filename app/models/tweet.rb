class Tweet < ActiveRecord::Base
    has_many:comments

    validates :user , :presence => true
    validates :tweet, :presence => true
end
