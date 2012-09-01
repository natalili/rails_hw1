class ItemsPresence < ActiveModel::Validator

  def validate(record)
    record.errors[:base] << "Must have items" unless check(record)
  end

  private

    def check(record)
      record.items.count > 0
#      true
    end
  
end