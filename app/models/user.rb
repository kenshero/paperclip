class User < ActiveRecord::Base
  
  # has_attached_file :photo,
  #                   :storage => :s3,
  #                   :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

 has_attached_file :photo,
  :styles => { :thumb => "100x100>" },
  :storage => :s3,
  :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
  :url =>':s3_domain_url',
  :path => '/:class/:attachment/:id_partition/:style/:filename'

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def s3_credentials
    {:bucket => "rails-img", 
     :access_key_id => "AKIAIABMSUNT5RTAW2GQ",
     :secret_access_key => "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"
    }
  end
end
