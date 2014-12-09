class SumValidator < ActiveModel::Validator
  def validate(record)
    if (record.asset_paid + record.asset_loan) != record.asset_cost
      record.errors[:base] << "Loan + Paid must equal cost of asset"
    end
    if (record.asset_paid > $cash)
      record.errors[:base] << "You don't have enough money for this purchase"
    end
  end
end

class FixedAsset < ActiveRecord::Base
  validates_with SumValidator
end
