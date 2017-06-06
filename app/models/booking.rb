class Booking < ApplicationRecord
  belongs_to :patient 
  belongs_to :doctor
  validates :patient_id, presence: { message: "patient id must be given please" }
  validates :doctor_id, presence: { message: "doctor id must be given please" }
  validates :b_date, presence: { message: "Booking date must be given please" }




  def detail(eid)
    pat = Doctor.where(email: eid) 
    return pat
  end

  def self.current
    where 'start_date <= :today AND (end_date IS NULL OR end_date >= :today)',
          today: Time.zone.today
  end

  def self.past_or_current
    where '(start_date <= :today AND (end_date IS NULL OR end_date >= :today))' \
          ' or end_date < :today', today: Time.zone.today
  end

  def self.current_or_future
    where '(start_date <= :today AND (end_date IS NULL OR end_date >= :today))' \
          ' or start_date > :today', today: Time.zone.today
  end

  def self.ordered_start_dates
    select('distinct start_date').unscoped.order('start_date').map(&:start_date)
  end
end
