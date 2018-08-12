class Item < ApplicationRecord
	  # validates :name, presence: true
		# validates :description, presence: true
		# validates :price, presence:true

		#for carrierwave to upload images

		mount_uploader :image, ImagesUploader

		validate :add_error_sample

  	def add_error_sample
    # nameが空のときにエラーメッセージを追加する
	    if name.blank?
	      errors[:base] << "商品名は必ず入力して下さい"
	    end

	    if description.blank?
	      errors[:base] << "説明文は必ず入力して下さい"
	    end

	    # 価格が空のときにエラーメッセージを追加する
	    if price.blank?
	      errors[:base] << "価格は必ず入力して下さい"
	    end
  	end
end
