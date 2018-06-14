# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  ord        :integer          not null
#  bonus      :boolean          default(FALSE)
#  lyrics     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  band_id    :integer          not null
#

class Track < ApplicationRecord
  validates :album_id, :title, :ord, presence: true
  validates :ord, uniqueness: { scope: :album_id }
  
  belongs_to :album 
  belongs_to :band
  
end
