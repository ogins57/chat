class Tweet < ActiveRecord::Base
    has_many:comments, :dependent => :destroy

    validates :user , :presence => true
    validates :tweet, :presence => true
end
