class User < ActiveRecord::Base
	before_validation { avatar.clear if @delete_avatar }
  has_attached_file :avatar, 
    :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :default_url => "missing.png",
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {
      :path => proc { |style| "#{style}/#{id}_#{avatar.original_filename}"},
      :unique_filename => true
    }
  #validates :avatar, :attachment_presence => true
  # Validate content type
  validates_attachment_content_type :avatar, :content_type => /\Aimage/
  # Validate filename
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]

  def delete_avatar
    @delete_avatar ||= false
  end

  def delete_avatar=(value)
    if value
      self.avatar = nil
    end
    @delete_avatar  = !value.to_i.zero?
  end
end
