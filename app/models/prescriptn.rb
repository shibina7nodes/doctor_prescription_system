class Prescriptn < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :medicine
  has_many :medicines
  has_many :prescriptn_details, dependent: :destroy
  accepts_nested_attributes_for :prescriptn_details
  validates :pres_date, presence: { message: "prescription date must be given please" }
  validates :patient_id, presence: { message: "patient id must be given please" }
  validates :doctor_id, presence: { message: "doctor id must be given please" }
   validates :patient_reason, presence: { message: "Patient reason must be given please" }
  def medicines_for_form
    collection = medicines.where(medicine_id: id)
    collection.any?collection:medicines.build
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
