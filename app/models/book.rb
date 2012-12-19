class Book < ActiveRecord::Base
  attr_accessible :authorname, :info, :isbn, :price, :publisher, :publisherdate, :quantity, :name, :category_ids, :stock_ids, :photo, :items
  validates_presence_of :authorname, :info, :isbn, :price, :publisher, :publisherdate, :quantity, :name, :user_id


  has_attached_file :photo,
      :path => ":rails_root/app/assets/images/user/:attachment/:id/:style/:filename",
      :url => ":rails_root/app/assets/images/user/:attachment/:id/:style/:filename"

has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" , :small => "150x150", :xsmall => "50x50"}
validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']



  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :stocks
  has_many :comments, as: :commentable
  scope :by_user_id, lambda {|uid| where(:user_id => uid)}
  scope :by_category_id, lambda {|cid| joins(:categories).where(['categories.id =?' ,cid])}
  scope :by_stock_id, lambda {|sid| joins(:stocks).where(['stocks.id =?' ,sid])}
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end


end
